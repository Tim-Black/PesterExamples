if (!((Get-Module pester -ListAvailable ).Version -eq '5.4.1')) {
    Install-Module pester -Force -RequiredVersion '5.4.1' 
}
Import-Module pester -RequiredVersion '5.4.1'
#DotSource the function
. ./Test-JSON.ps1

Describe "Test-JSON Function" {
    It "Returns a Valid JSON response" {
        $File = "./Valid.JSON"
        $result = Test-JSON -InputFile $File
        $result | Should -Be "Input Was Valid JSON"
    }
    It "Returns Invalid JSON response"{
        $file = "./Test-JSON.ps1"
        $result = Test-JSON -InputFile $File
        $result | Should -Be "Input Was not valid JSON"
    }
}
Describe "API Responsive"{
    It "Returns Valid 200 Result"{
        $WebRequest = IWR -URI 127.0.0.1:8080 -method get -UseBasicParsing
        $WebRequest.StatusCode | Should -Be 200   
    }
}