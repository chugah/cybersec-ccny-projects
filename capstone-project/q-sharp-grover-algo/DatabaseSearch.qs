// The following code is based on Microsoft's quantum katas for Grover's algorithm

namespace Microsoft.Quantum.Samples.DatabaseSearch {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Oracles;
    open Microsoft.Quantum.AmplitudeAmplification;

    operation ApplyDatabaseOracle(markedQubit : Qubit, databaseRegister : Qubit[]) : Unit is Adj + Ctl {
        Controlled X(databaseRegister, markedQubit);
    }

    operation ApplyUniformSuperpositionOracle(databaseRegister : Qubit[]) : Unit is Adj + Ctl {
        ApplyToEachCA(H, databaseRegister);
    }

    operation ApplyStatePreparationOracle (markedQubit : Qubit, databaseRegister : Qubit[]) : Unit is Adj + Ctl {
        ApplyUniformSuperpositionOracle(databaseRegister);
        ApplyDatabaseOracle(markedQubit, databaseRegister);
    }

    operation ReflectAboutMarkedState(markedQubit : Qubit) : Unit {
        // Marked elements always have the marked qubit in the state |1〉.
        R1(PI(), markedQubit);
    }

    operation ReflectAboutZero(databaseRegister : Qubit[]) : Unit {
        within {
            ApplyToEachCA(X, databaseRegister);
        } apply {
            Controlled Z(Rest(databaseRegister), Head(databaseRegister));
        }
    }

    operation ReflectAboutInitialState(markedQubit : Qubit, databaseRegister : Qubit[]) : Unit {
        within {
            Adjoint ApplyStatePreparationOracle(markedQubit, databaseRegister);
        } apply {
            ReflectAboutZero([markedQubit] + databaseRegister);
        }
    }

    operation SearchForMarkedState(nIterations : Int, markedQubit : Qubit, databaseRegister : Qubit[]) : Unit {
        ApplyStatePreparationOracle(markedQubit, databaseRegister);

        for idx in 0 .. nIterations - 1 {
            ReflectAboutMarkedState(markedQubit);
            ReflectAboutInitialState(markedQubit, databaseRegister);
        }
    }

    operation ApplyQuantumSearch(nIterations : Int, nDatabaseQubits : Int) : (Result, Result[]) {
        // Allocate nDatabaseQubits + 1 qubits. These are all in the |0〉
        // state.
        use markedQubit = Qubit();
        use databaseRegister = Qubit[nDatabaseQubits];

        // Implement the quantum search algorithm.
        SearchForMarkedState(nIterations, markedQubit, databaseRegister);

        // Measure the marked qubit. On success, this should be One.
        let resultSuccess = MResetZ(markedQubit);

        // Measure the state of the database register post-selected on
        // the state of the marked qubit.
        let resultElement = ForEach(MResetZ, databaseRegister);

        // Returns the measurement results of the algorithm.
        return (resultSuccess, resultElement);
    }

    operation StatePreparationOracleTest() : Unit {
        for nDatabaseQubits in 0..5 {
            use (markedQubit, databaseRegister) = (Qubit(), Qubit[nDatabaseQubits]);
            ApplyStatePreparationOracle(markedQubit, databaseRegister);

            // This is the success probability as predicted by theory.
            // Note that this is computed only to verify that the
            // implemented Grover's algorithm is correct in the
            // `AssertProb` below.
            let successAmplitude = 1.0 / Sqrt(IntAsDouble(2 ^ nDatabaseQubits));
            let successProbability = successAmplitude * successAmplitude;
            AssertMeasurementProbability([PauliZ], [markedQubit], One, successProbability, "Error: Success probability does not match theory", 1E-10);

            // This operation automatically resets all qubits to |0〉
            // for safe deallocation.
            Reset(markedQubit);
            ResetAll(databaseRegister);
        }
    }

    operation ApplyDatabaseOracleFromInts(markedElements : Int[], markedQubit : Qubit, databaseRegister : Qubit[])
    : Unit
    is Adj + Ctl {
        for markedElement in markedElements {
            ControlledOnInt(markedElement, X)(databaseRegister, markedQubit);
        }
    }

    operation _GroverStatePrepOracle(markedElements : Int[], idxMarkedQubit : Int, startQubits : Qubit[])
    : Unit
    is Adj + Ctl {
        let flagQubit = startQubits[idxMarkedQubit];
        let databaseRegister = Exclude([idxMarkedQubit], startQubits);

        // Apply oracle `U`
        ApplyToEachCA(H, databaseRegister);

        // Apply oracle `D`
        ApplyDatabaseOracleFromInts(markedElements, flagQubit, databaseRegister);
    }

    function GroverStatePrepOracle(markedElements : Int[]) : StateOracle {
        return StateOracle(_GroverStatePrepOracle(markedElements, _, _));
    }

    function GroverSearch(markedElements : Int[], nIterations : Int, idxMarkedQubit : Int)
    : (Qubit[] => Unit is Adj + Ctl) {
        return StandardAmplitudeAmplification(nIterations, GroverStatePrepOracle(markedElements), idxMarkedQubit);
    }

    operation ApplyGroverSearch(markedElements : Int[], nIterations : Int, nDatabaseQubits : Int) : (Result, Int) {
        // Allocate nDatabaseQubits + 1 qubits. These are all in the |0〉
        // state.
        use (markedQubit, databaseRegister) = (Qubit(), Qubit[nDatabaseQubits]);
        // Implement the quantum search algorithm.
        GroverSearch(markedElements, nIterations, 0)([markedQubit] + databaseRegister);

        // Measure the marked qubit. On success, this should be One.
        let resultSuccess = MResetZ(markedQubit);

        // Measure the state of the database register post-selected on
        // the state of the marked qubit and return the measurement results
        // of the algorithm.
        return (resultSuccess, ResultArrayAsInt(ForEach(MResetZ, databaseRegister)));
    }

}
