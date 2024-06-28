---
external help file: MyModules-help.xml
Module Name: MyModules
online version:
schema: 2.0.0
---

# Convert-EPOCHDateTime

## SYNOPSIS

## SYNTAX

```
Convert-EPOCHDateTime [-InputTime] <Object> [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### EXAMPLE 1
```powershell
Convert-EPOCHDateTime -InputTime -9147600
```
Converts Unix EPOCH date -9147600 to a human readable date
    
```text
InputTime LocalTimezone         LocalTime           UTCTime
--------- -------------         ---------           -------
999999094 Eastern Standard Time 9/8/2001 9:31:34 PM 9/9/2001 1:31:34 AM
```


### EXAMPLE 2
```powershell

-9147600,1539613448,1529604105 | Convert-EPOCHDateTime

```
Converts multiple Unix EPOCH dates from the pipeline to human readable date


```text
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
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
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
[String] [[Object]]
## OUTPUTS
[[PSObject]]
## NOTES
Author: Johnny Leuthard

## RELATED LINKS
