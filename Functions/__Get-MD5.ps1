<#
   	.Synopsis
		Get MD5 hash of a string
   	.Description
		Get MD5 hash of a string

	.Parameter InputString
		The text to Hash
	.Parameter Base64


	.Example
		Get-MD5 "This is my text"

		Description
		-----------------
		displayes the following

		Text              MD5                              X64
		----              ---                              ---
		This is my text   B824D73E98D50F4C0A3C42CDD9D6B694 N/A


	.Example
		Get-MD5 "This is my text"  -base64

		Description
		-----------------
		displayes the following

		Text            MD5   X64
		----            ---   ---
		This is my text N/A   uCTXPpjVD0wKPELN2da2lA==

	.Example
		 Get-Content "C:\Learning\Scripting\PowerShell\cmdlets\On-Line\InputTestFile.txt" | Get-MD5

		Description
		-----------------
		displayes the following hashs from a list of words in a tesxt fike

		Text     MD5                              X64
		----     ---                              ---
		Red      1EB780457550C252423946EA865BCD81 N/A
		Blue     BBC468CB836617861ABB22D5988E25E9 N/A
		Green    7BB36A50FAAE13898CD1A991D192004B N/A
		Password FCD9449DF6E7E5ADAA69B9CF32860E14 N/A
		PA$$w0rd D39305644F0527638B810E3C1F8B92EA N/A
		Has1     2B7C02A75FB6B7BFA6CC2433E2B0E08D N/A
		Hash1    7686DC3DE8D43E0FF3E292028C4070C3 N/A


	.Link
		Script a modifyed version form the following
		http://www.vistax64.com/powershell/28652-howto-create-md5-file.html

	.Notes
    		Author: Johnny Leuthard

#>
Function Get-MD5
{

  [cmdletbinding(DefaultParameterSetName = 'None')]
  Param
  (
    [Parameter(Mandatory, Position = 0, ValuefromPipeline)]
    [ValidateNotNullOrEmpty()]
    $inputString,
    #$file,
    [switch]$Base64

  )
  Begin
  {


  }
  Process
  {

    If ($file)
    {
      $input = get-content -encoding byte -readcount -1 $file
    }
    Else
    {
      $input = [System.Text.Encoding]::Unicode.GetBytes($inputString)
    }

    $md5 = [System.Security.Cryptography.MD5]::Create()
    $output = $md5.ComputeHash($input)

    If ($base64)
    {
      $X64Hash = [System.Convert]::ToBase64String($output)

      $MyCustomObject = New-Object System.Object
      $MyCustomObject | Add-Member -type NoteProperty -name Text -Value $inputString
      $MyCustomObject | Add-Member -type NoteProperty -name MD5 -Value "N/A"
      $MyCustomObject | Add-Member -type NoteProperty -name X64 -Value $X64Hash

    }
    Else
    {
      $sb = new-object Text.StringBuilder
      ForEach ($b in $output)
      {
        [void] $sb.Append($b.ToString("X2"));
      }

      #$sb.ToString()

      $MyCustomObject = New-Object System.Object
      $MyCustomObject | Add-Member -type NoteProperty -name Text -Value $inputString
      $MyCustomObject | Add-Member -type NoteProperty -name MD5 -Value $sb.ToString()
      $MyCustomObject | Add-Member -type NoteProperty -name X64 -Value "N/A"

    }


    $MyCustomObject

  }#(Proces))
  End
  {

 	}

}#End Function
####################
### Notes
####################
<#

	#TODO
	=======
	- Fix it so the swith to use a file rather than text will work again.

	Get-Content "C:\Users\johnny\Documents\Security\Hash_InputText.txt" | Get-MD5


	"Testing 1..2..3.." | get-md5

#>

