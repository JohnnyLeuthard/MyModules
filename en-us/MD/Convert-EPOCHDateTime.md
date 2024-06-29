---
external help file: MyModules-help.xml
Module Name: MyModules
online version: https://github.com/JohnnyLeuthard/MyModules/blob/main/en-us/MD/Convert-EPOCHDateTime.md
schema: 2.0.0
---

# Convert-EPOCHDateTime


## SYNOPSIS
Converts Unix EPOCH time to a human readable date

## SYNTAX

### All (Default)
```
Convert-EPOCHDateTime [-InputTime] <String> [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### Dummy
```
Convert-EPOCHDateTime [[-InputTime] <String>] [-DummySwitch] [-ProgressAction <ActionPreference>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Converts Unix EPOCH time to a human readable date displaying in format of severl different time zones

## EXAMPLES

### EXAMPLE 1
```powershell
Convert-EPOCHDateTime -InputTime 1729999999
```

```
InputTime LocalTimezone         LocalTime              UTCTime
--------- -------------         ---------              -------
1729999999 Eastern Standard Time 10/26/2024 11:33:19 PM 10/27/2024 3:33:19 AM
```

### EXAMPLE 2
```powershell
-9147600,1539613448,1529604105 | Convert-EPOCHDateTime
```

```
InputTime LocalTimezone         LocalTime              UTCTime
--------- -------------         ---------              -------
  -9147600 Eastern Standard Time 9/16/1969 11:00:00 PM  9/17/1969 3:00:00 AM
  1539613448 Eastern Standard Time 10/15/2018 10:24:08 AM 10/15/2018 2:24:08 PM
  1529604105 Eastern Standard Time 6/21/2018 2:01:45 PM   6/21/2018 6:01:45 PM
```

## PARAMETERS

### -InputTime
The EPOCH time to convert

```yaml
Type: String
Parameter Sets: All
Aliases: Time

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: Dummy
Aliases: Time

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -DummySwitch
Just a dummy switch to test if udates are working.
It doesn't really do anythng but spit a message to the screen in rghw "end" section of the function.

```yaml
Type: SwitchParameter
Parameter Sets: Dummy
Aliases: Dummy

Required: True
Position: 1
Default value: False
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Author: Johnny Leuthard

## RELATED LINKS

[https://github.com/JohnnyLeuthard/MyModules/blob/main/en-us/MD/Convert-EPOCHDateTime.md](https://github.com/JohnnyLeuthard/MyModules/blob/main/en-us/MD/Convert-EPOCHDateTime.md)

