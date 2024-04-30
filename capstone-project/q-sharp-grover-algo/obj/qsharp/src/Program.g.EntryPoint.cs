//------------------------------------------------------------------------------
// <auto-generated>                                                             
//     This code was generated by a tool.                                       
//     Changes to this file may cause incorrect behavior and will be lost if    
//     the code is regenerated.                                                 
// </auto-generated>                                                            
//------------------------------------------------------------------------------
using System;
using Microsoft.Quantum.Core;
using Microsoft.Quantum.Intrinsic;
using Microsoft.Quantum.Intrinsic.Interfaces;
using Microsoft.Quantum.Simulation.Core;

namespace Microsoft.Quantum.Samples.DatabaseSearch
{
    internal class __QsEntryPoint__RunMultipleQuantumSearch : global::Microsoft.Quantum.EntryPointDriver.IEntryPoint
    {
        public string Name => "Microsoft.Quantum.Samples.DatabaseSearch.RunMultipleQuantumSearch";
        public string Summary => "";
        public System.Collections.Generic.IEnumerable<System.CommandLine.Option> Options => new System.CommandLine.Option[] { };
        private static QVoid CreateArgument(System.CommandLine.Parsing.ParseResult parseResult) => QVoid.Instance;
        public System.Threading.Tasks.Task<int> GenerateAzurePayload(System.CommandLine.Parsing.ParseResult parseResult, global::Microsoft.Quantum.EntryPointDriver.GenerateAzurePayloadSettings settings) => global::Microsoft.Quantum.EntryPointDriver.Azure.GenerateAzurePayload(settings, global::System.Reflection.Assembly.GetExecutingAssembly().GetManifestResourceStream("__qsharp_data_qir_v1__.bc") is { } qirStream ? new global::Microsoft.Quantum.EntryPointDriver.QirSubmission(qirStream, "Microsoft.Quantum.Samples.DatabaseSearch.RunMultipleQuantumSearch", global::System.Collections.Immutable.ImmutableList.Create<global::Microsoft.Quantum.Runtime.Argument>()) : null);
        public System.Threading.Tasks.Task<int> Submit(System.CommandLine.Parsing.ParseResult parseResult, global::Microsoft.Quantum.EntryPointDriver.AzureSettings settings) => global::Microsoft.Quantum.EntryPointDriver.Azure.Submit(settings, new global::Microsoft.Quantum.EntryPointDriver.QSharpSubmission<QVoid, QVoid>(global::Microsoft.Quantum.Samples.DatabaseSearch.RunMultipleQuantumSearch.Info, CreateArgument(parseResult)), global::System.Reflection.Assembly.GetExecutingAssembly().GetManifestResourceStream("__qsharp_data_qir_v1__.bc") is { } qirStream ? new global::Microsoft.Quantum.EntryPointDriver.QirSubmission(qirStream, "Microsoft.Quantum.Samples.DatabaseSearch.RunMultipleQuantumSearch", global::System.Collections.Immutable.ImmutableList.Create<global::Microsoft.Quantum.Runtime.Argument>()) : null);
        public System.Threading.Tasks.Task<int> Simulate(System.CommandLine.Parsing.ParseResult parseResult, global::Microsoft.Quantum.EntryPointDriver.DriverSettings settings, string simulator) => global::Microsoft.Quantum.EntryPointDriver.Simulation<global::Microsoft.Quantum.Samples.DatabaseSearch.RunMultipleQuantumSearch, QVoid, QVoid>.Simulate(this, CreateArgument(parseResult), settings, simulator);
    }

    internal class __QsEntryPoint__RunRandomSearch : global::Microsoft.Quantum.EntryPointDriver.IEntryPoint
    {
        public string Name => "Microsoft.Quantum.Samples.DatabaseSearch.RunRandomSearch";
        public string Summary => "";
        public System.Collections.Generic.IEnumerable<System.CommandLine.Option> Options => new System.CommandLine.Option[] { };
        private static QVoid CreateArgument(System.CommandLine.Parsing.ParseResult parseResult) => QVoid.Instance;
        public System.Threading.Tasks.Task<int> GenerateAzurePayload(System.CommandLine.Parsing.ParseResult parseResult, global::Microsoft.Quantum.EntryPointDriver.GenerateAzurePayloadSettings settings) => global::Microsoft.Quantum.EntryPointDriver.Azure.GenerateAzurePayload(settings, global::System.Reflection.Assembly.GetExecutingAssembly().GetManifestResourceStream("__qsharp_data_qir_v1__.bc") is { } qirStream ? new global::Microsoft.Quantum.EntryPointDriver.QirSubmission(qirStream, "Microsoft.Quantum.Samples.DatabaseSearch.RunRandomSearch", global::System.Collections.Immutable.ImmutableList.Create<global::Microsoft.Quantum.Runtime.Argument>()) : null);
        public System.Threading.Tasks.Task<int> Submit(System.CommandLine.Parsing.ParseResult parseResult, global::Microsoft.Quantum.EntryPointDriver.AzureSettings settings) => global::Microsoft.Quantum.EntryPointDriver.Azure.Submit(settings, new global::Microsoft.Quantum.EntryPointDriver.QSharpSubmission<QVoid, QVoid>(global::Microsoft.Quantum.Samples.DatabaseSearch.RunRandomSearch.Info, CreateArgument(parseResult)), global::System.Reflection.Assembly.GetExecutingAssembly().GetManifestResourceStream("__qsharp_data_qir_v1__.bc") is { } qirStream ? new global::Microsoft.Quantum.EntryPointDriver.QirSubmission(qirStream, "Microsoft.Quantum.Samples.DatabaseSearch.RunRandomSearch", global::System.Collections.Immutable.ImmutableList.Create<global::Microsoft.Quantum.Runtime.Argument>()) : null);
        public System.Threading.Tasks.Task<int> Simulate(System.CommandLine.Parsing.ParseResult parseResult, global::Microsoft.Quantum.EntryPointDriver.DriverSettings settings, string simulator) => global::Microsoft.Quantum.EntryPointDriver.Simulation<global::Microsoft.Quantum.Samples.DatabaseSearch.RunRandomSearch, QVoid, QVoid>.Simulate(this, CreateArgument(parseResult), settings, simulator);
    }

    internal class __QsEntryPoint__RunQuantumSearch : global::Microsoft.Quantum.EntryPointDriver.IEntryPoint
    {
        public string Name => "Microsoft.Quantum.Samples.DatabaseSearch.RunQuantumSearch";
        public string Summary => "";
        public System.Collections.Generic.IEnumerable<System.CommandLine.Option> Options => new System.CommandLine.Option[] { };
        private static QVoid CreateArgument(System.CommandLine.Parsing.ParseResult parseResult) => QVoid.Instance;
        public System.Threading.Tasks.Task<int> GenerateAzurePayload(System.CommandLine.Parsing.ParseResult parseResult, global::Microsoft.Quantum.EntryPointDriver.GenerateAzurePayloadSettings settings) => global::Microsoft.Quantum.EntryPointDriver.Azure.GenerateAzurePayload(settings, global::System.Reflection.Assembly.GetExecutingAssembly().GetManifestResourceStream("__qsharp_data_qir_v1__.bc") is { } qirStream ? new global::Microsoft.Quantum.EntryPointDriver.QirSubmission(qirStream, "Microsoft.Quantum.Samples.DatabaseSearch.RunQuantumSearch", global::System.Collections.Immutable.ImmutableList.Create<global::Microsoft.Quantum.Runtime.Argument>()) : null);
        public System.Threading.Tasks.Task<int> Submit(System.CommandLine.Parsing.ParseResult parseResult, global::Microsoft.Quantum.EntryPointDriver.AzureSettings settings) => global::Microsoft.Quantum.EntryPointDriver.Azure.Submit(settings, new global::Microsoft.Quantum.EntryPointDriver.QSharpSubmission<QVoid, QVoid>(global::Microsoft.Quantum.Samples.DatabaseSearch.RunQuantumSearch.Info, CreateArgument(parseResult)), global::System.Reflection.Assembly.GetExecutingAssembly().GetManifestResourceStream("__qsharp_data_qir_v1__.bc") is { } qirStream ? new global::Microsoft.Quantum.EntryPointDriver.QirSubmission(qirStream, "Microsoft.Quantum.Samples.DatabaseSearch.RunQuantumSearch", global::System.Collections.Immutable.ImmutableList.Create<global::Microsoft.Quantum.Runtime.Argument>()) : null);
        public System.Threading.Tasks.Task<int> Simulate(System.CommandLine.Parsing.ParseResult parseResult, global::Microsoft.Quantum.EntryPointDriver.DriverSettings settings, string simulator) => global::Microsoft.Quantum.EntryPointDriver.Simulation<global::Microsoft.Quantum.Samples.DatabaseSearch.RunQuantumSearch, QVoid, QVoid>.Simulate(this, CreateArgument(parseResult), settings, simulator);
    }
}