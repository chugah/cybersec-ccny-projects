namespace q_sharp_test {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Random;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;

    @EntryPoint()

    operation Run_BB84ProtocolWithEavesdropper () : Unit {
        let threshold = 1;


        use qs = Qubit[20];
        // 1. Choose random basis and bits to encode
        let basesAlice = RandomArray(Length(qs));
        let bitsAlice = RandomArray(Length(qs));


        // 2. Alice prepares her qubits
        PrepareAlicesQubits(qs, basesAlice, bitsAlice);


        // Eve eavesdrops on all qubits, guessing the basis at random
        for q in qs {
            let n = Eavesdrop(q, DrawRandomBool(0.5));
        }


        // 3. Bob chooses random basis to measure in
        let basesBob = RandomArray(Length(qs));


        // 4. Bob measures Alice's qubits'
        let bitsBob = MeasureBobsQubits(qs, basesBob);


        // 5. Generate shared key
        let keyAlice = GenerateSharedKey(basesAlice, basesBob, bitsAlice);
        let keyBob = GenerateSharedKey(basesAlice, basesBob, bitsBob);


        // 6. Ensure at least the minimum percentage of bits match
        if CheckKeysMatch(keyAlice, keyBob, threshold) {
            Message($"Successfully generated keys {keyAlice}/{keyBob}");
        } else {
            Message($"Caught an eavesdropper, discarding the keys {keyAlice}/{keyBob}");
        }
    }

    operation RandomArray (N : Int) : Bool[] {
    
    // Step 1: Create array of size N with default value false
    mutable array = [false, size = N];

    // Step 2: Iterate through all elements of the array and set the random value using DrawRandomBool function
    for i in 0 .. N - 1 {
        set array w/= i <- DrawRandomBool(0.5);
    }

    // Step 3: Return the random bool array
    return array;
    }

    operation PrepareAlicesQubits (qs : Qubit[], bases : Bool[], bits : Bool[]) : Unit {
    // Iterate over all the qubits to prepare each one
        for i in 0 .. Length(qs) - 1 {
            if bits[i] {
                X(qs[i]);
            }
            if bases[i] {
                H(qs[i]);
            }
        }
    }

    operation MeasureBobsQubits (qs : Qubit[], bases : Bool[]) : Bool[] {
        
        // Iterate over all the qubits
        for i in 0 .. Length(qs) - 1 {
            if bases[i] {
                H(qs[i]);
            }
        }
            
        // MutliM(qs) produces Result[] which is taken by ResultArrayAsBoolArray as the input.
        return ResultArrayAsBoolArray(MultiM(qs));
    }

    function GenerateSharedKey (basesAlice : Bool[], basesBob : Bool[], measurementsBob : Bool[]) : Bool[] {  

        // Step 1: Declare empty array key for storing the required value of key
        mutable key = [];  
        
        // Iteration over all the qubit sending attempts
        // Zipped3 function ensures we iterate over a tuple of 3 items.
        for (a, b, bit) in Zipped3(basesAlice, basesBob, measurementsBob) {
            if a == b {
                set key += [bit]; // Step 2: Add bit to the key in case bases of both Alice and Bob matches
            }
        }  
        
        // Step 3: Return the required key
        return key;
    }

    function CheckKeysMatch (keyAlice : Bool[], keyBob : Bool[], errorRate : Int) : Bool {
  
        let N = Length(keyAlice);
        
        // Declare a variable to count the number of mismatched bits
        mutable mismatchCount = 0;
        
        for i in 0 .. N - 1 {
            if keyAlice[i] != keyBob[i] {
                set mismatchCount += 1; // Increment the counter whenever a mismatch is found
            }
        }


        // return true if probability of mismatched bits is less than the Error Rate provided
        return IntAsDouble(mismatchCount) / IntAsDouble(N) <= IntAsDouble(errorRate) / 100.0;
    }  

    operation Eavesdrop (q : Qubit, basis : Bool) : Bool {
    
        // Measurement along X axis if basis is diagonal basis and Z axis, otherwise.
        return ResultAsBool(Measure([basis ? PauliX | PauliZ], [q]));
    }
}
