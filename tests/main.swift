#if os(macOS)
import Darwin
#elseif os(Linux)
import Glibc
#endif


do 
{
    var arguments:[String] = CommandLine.arguments
    let _:String = arguments.removeFirst()
    var verbose:Bool = false
    var test_subset:Set<String> = []

    for arg in arguments
    {
        if arg == "-v" || arg == "-verbose" || arg == "--verbose"
        {
            verbose = true
        }
        else
        {
            test_subset.insert(arg)
        }
    }

    exit(run_tests(tests, verbose: verbose, only_run: test_subset.isEmpty ? nil : test_subset))
}
