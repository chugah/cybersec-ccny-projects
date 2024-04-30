This Q# project runs a simulation of a random search of a database. This search compares the performance of the classical versus Grover's algorithms. Microsoft's QDK amplitude amplification library is used in this evaluation.

The three search versions are as follows:

- A search made without any Grover iterations, equivalent to a random classical search.
- A quantum search using manually implemented Grover iterations to amplify the marked element.
- A quantum search using operations from the Q# standard library to amplify multiple marked elements.

Ensure the correct QDK and dotnet v6 packages are locally installed. Links below are provided to obtain the appropriate versions.

To run each simulation, clone this repo and cd into the root of this directory.
Enter the commands listed below in the terminal for each search type:

- dotnet run simulate Microsoft.Quantum.Samples.DatabaseSearch.RunRandomSearch
- dotnet run simulate Microsoft.Quantum.Samples.DatabaseSearch.RunQuantumSearch
- dotnet run simulate Microsoft.Quantum.Samples.DatabaseSearch.RunMultipleQuantumSearch


Link to QDK

https://marketplace.visualstudio.com/items?itemName=zetta.qsharp-extensionpack

Link to dotnet CLI

https://github.com/NuGet/docs.microsoft.com-nuget/blob/main/docs/consume-packages/install-use-packages-dotnet-cli.md

Link to NuGet Packages

https://www.nuget.org/packages/Microsoft.Quantum.Sdk/

Link to dotnet commands

https://learn.microsoft.com/en-us/answers/questions/1390472/build-error-when-trying-to-run-a-quantum-developme

Link to dotnet releases

https://github.com/dotnet/core/blob/main/release-notes/5.0/5.0.0/5.0.0-install-instructions.md
