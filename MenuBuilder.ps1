function Menu-Builder ($Title, $Question, [String[]]$Options) {   
    #This function allows you to create a menu with any number of options. 
    #It takes three arguments: the title of the menu, the question to ask the user, 
    #and an array of strings representing the menu options. 
    #The function returns the selected menu option as a string.

    #Creates loops through $Options to create a ChoiceDescription object based on string value in $Options
    $Options += "Exit"
    foreach ($option in $Options){           
        $convertedOption = New-Object System.Management.Automation.Host.ChoiceDescription "&$($option)"
        [System.Management.Automation.Host.ChoiceDescription[]]$menuOptions += [System.Management.Automation.Host.ChoiceDescription[]]($convertedOption)
    }
    $choice = $host.ui.PromptForChoice($Title, $Question, $menuOptions, 0)
    if ($Options[$choice] -eq "Exit"){
        Write-Host "Now exiting script, good bye"
        break
    }
    Return $Options[$choice]
}
