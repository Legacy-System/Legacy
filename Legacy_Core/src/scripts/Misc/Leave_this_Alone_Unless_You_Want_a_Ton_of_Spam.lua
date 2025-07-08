function deleteFull()
deleteCheck = deleteCheck or false --just declares new var to use
  deleteLine()
  if DelLPrompt == true then deleteCheck = true end
  DelLPrompt = true
  delPromptCheck = tempLineTrigger(1,1,[[if not isPrompt() then
    if deleteCheck == true then deleteCheck = false else DelLPrompt = false end
  end]])
  
end

function deleteFullOld()
  deleteLine()
  tempLineTrigger(1,1,[[if isPrompt() then
    deleteLine()
    DelLPrompt = true
  end]])
end