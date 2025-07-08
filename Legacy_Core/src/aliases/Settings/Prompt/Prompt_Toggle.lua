if Legacy.Settings.usePrompt == nil or Legacy.Settings.usePrompt == false then
  Legacy.Settings.usePrompt = true
  enableTrigger("Legacy Prompt")
else
  Legacy.Settings.usePrompt = false
  send("config prompt all")
  disableTrigger("Legacy Prompt")
end