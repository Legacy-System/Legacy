function needCuringSwap()
   if not Legacy then return end
  Legacy.Curing.needCuringSwap = true
end

registerAnonymousEventHandler("gmcp.Char.Afflictions", "needCuringSwap")
registerAnonymousEventHandler("gmcp.Room.Info", "needCuringSwap")