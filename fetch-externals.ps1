function expandArchive ($file) {
  Write-Host "Expanding $file"
  $fileExtension = $file.substring($file.length - 3, 3)
  if ($fileExtension -eq "zip") {
    Expand-Archive $file
  } elseif ($fileExtension -eq "tar") {
  tar xf $file
  } else {
  Write-Host "Unknown file ending: [$fileExtension]"
  }
}

function fileDownloadAndValidate( $uri, $outFile, $sha256Hash ) {
  Write-Host "Downloading $uri"
  Invoke-WebRequest -Uri "$uri" -OutFile "$outFile"
  $calculatedHash = ( Get-FileHash -Algorithm SHA256 $outFile ).Hash
  if ($calculatedHash -ne "$sha256Hash") {
    Write-Host "ERROR: Incorrect SHA256 hash of [$calculatedHash] for [$outFile]; expected [$sha256Hash]"
    exit -1
  }
}

$externals = Import-Csv "externals.csv"
$externals | ForEach-Object {
  fileDownloadAndValidate $_.uri $_.outFile $_.sha256Hash
  expandArchive $_.outFile
}
