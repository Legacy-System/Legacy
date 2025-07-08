if tonumber(Legacy.Settings.IGDate.year) > math.floor(IHateMathSoIWroteThis.term + IHateMathSoIWroteThis.newestDate) then
  Legacy.echo("A fine of <gold>"..math.reint(IHateMathSoIWroteThis.fines).."<white> gold and no time left to serve.")
else
  Legacy.echo("A fine of <gold>"..math.reint(IHateMathSoIWroteThis.fines).."<white> gold and <gold>"..math.floor((IHateMathSoIWroteThis.term + IHateMathSoIWroteThis.newestDate) - tonumber(Legacy.Settings.IGDate.year)).." <white>years left to serve.")
end
disableTrigger("Crime Stopper")
disableTrigger("Crime Catcher")