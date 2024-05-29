function Test-JSON ($InputFile){
    try {
        $TestFile = GC $InputFile
        $null = ConvertFrom-JSON $TestFile
        return "Input Was Valid JSON"
    }
    catch {
        return "Input Was not valid JSON"
    }
}