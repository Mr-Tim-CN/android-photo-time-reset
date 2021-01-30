Get-ChildItem *.jpg | ForEach {
  # 取得照片拍攝日期
  $date = (.\exif-datetaken.ps1 $_.FullName)

  # 檢查照片拍攝日期
  if ($date -eq $null) {
    Write-Host $_.Name ' 无拍摄时间信息'
    return
  }
  
  if ($_.LastWriteTime -eq $date) {
    Write-Host $_.Name ' 拍摄时间与修改时间相同'
    return
  }

  $_.LastWriteTime = $date
  Write-Host $_.Name ' 修改成功'
}