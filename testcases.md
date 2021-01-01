# Channels 1 & 2 - Tone

## Sound Length (Counter/Consecutive)

- Sound plays indefinitely when counter is disabled (`L101`)
- Sound lengths are accurate (`L102`)
- Increase sound length during sound (`L103`)
- Decrease sound length during sound (`L104`)
- Disable Sound length during sound (`L105`)
- Enable Sound length during sound (`L106`)

## Wave Duty

- Wave duty values are accurate (`D101`)
- Modify wave duty during sound (wave duty modulation) (`D102`)

## Frequency

- Frequency values are accurate  (`F101`)
- Modify frequency during sound (`F102`)

## Volume Envelope

- Initial Volume values are accurate (volume sweep disabled)  (`E101`)
- Volume sweep ramp deltas are accurate (use slowest ramp, min/mid/max starting volumes) - ascending (`E102`)
- Volume sweep ramp deltas are accurate (use slowest ramp, min/mid/max starting volumes) - descending (`E103`)
- Volume sweep ramp slopes are accurate - ascending (`E104`)
- Volume sweep ramp slopes are accurate - descending (`E105`)
- Modify initial volume during sweep (`E106`)
- Modify ramp direction during sweep (`E107`)
- Modify ramp slope during sweep (`E108`)
- Restart sound during sweep (`E109`)

## Frequency Sweep (Ch. 1 only)

- Sweep Time values are accurate  (`S101`)
- Sweep Shift values are accurate - ascending (`S102`)
- Sweep Shift values are accurate - descending(`S103`)
- Modify Sweep Time during sweep (`S104`)
- Modify Sweep Direction during sweep (`S105`)
- Modify Sweep Shift value during sweep (`S106`)
- Restart sound during sweep (`S107`)

## Sound ON Register Flags

- Sound flag should be OFF when Channel is disabled  (`Z101`)
- Sound flag should be ON when Counter mode is enabled and sound is playing
- Sound flag should be OFF when Counter mode is ennabled and sound has stopped
- Sound flag should be ON when Counter mode is disabled and sound is playing
- Sound flag should be ON when Envelope volume is 0, but Counter has not ended

# Channel 3 - Waveform

`TODO`


# Channel 4 - Noise

`TODO`


# Output Terminal

- Modify output channel selection during sound - None, Left, Right, Both  (`OT01`)
- Modify Master volume during sound (`OT02`)
- Disable APU during sound (`0T03`)
