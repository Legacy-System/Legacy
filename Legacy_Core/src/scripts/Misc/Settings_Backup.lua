function Legacy_Backup()
  if Legacy then
    if Legacy.Settings.backupLocation then
      table.save(getMudletHomeDir().."/Legacy/Backup/Backup.lua", Legacy)
    end
  end
end