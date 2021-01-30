Get-ChildItem *.jpg | ForEach {
  # ȡ����Ƭ�Ĕz����
  $date = (.\exif-datetaken.ps1 $_.FullName)

  # �z����Ƭ�Ĕz����
  if ($date -eq $null) {
    Write-Host $_.Name ' ������ʱ����Ϣ'
    return
  }
  
  if ($_.LastWriteTime -eq $date) {
    Write-Host $_.Name ' ����ʱ�����޸�ʱ����ͬ'
    return
  }

  $_.LastWriteTime = $date
  Write-Host $_.Name ' �޸ĳɹ�'
}