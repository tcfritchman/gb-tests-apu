# gb-tests-apu

Gameboy audio hardware test program

# Test Cases

## Channels 1 & 2 - Tone

### Sound Length (Counter/Consecutive)
- Sound plays indefinitely when counter is disabled (`L101`, `L201`)
- Sound lengths are accurate (`L102`, `L202`)
- Increase sound length during sound (`L103`, `L203`)
- Decrease sound length during sound (`L104`, `L204`)
- Disable Sound length during sound (`L105`, `L205`)
- Enable Sound length during sound (`L106`, `L206`)

### Wave Duty
- Wave duty values are accurate (`D101`, `D201`)
- Modify wave duty during sound (wave duty modulation) (`D102`, `D202`)

### Frequency
- Frequency values are accurate  (`F101`, `F201`)
- Modify frequency during sound (`F102`, `F202`)

### Volume Envelope
- Initial Volume values are accurate (volume sweep disabled)  (`E101`, `E201`)
- Volume sweep ramp deltas are accurate (use slowest ramp, min/mid/max starting volumes) - ascending (`E102`, `E202`)
- Volume sweep ramp deltas are accurate (use slowest ramp, min/mid/max starting volumes) - descending (`E103`, `E203`)
- Volume sweep ramp slopes are accurate - ascending (`E104`, `E204`)
- Volume sweep ramp slopes are accurate - descending (`E105`, `E205`)
- Modify initial volume during sweep (`E106`, `E206`)
- Modify ramp direction during sweep (`E107`, `E207`)
- Modify ramp slope during sweep (`E108`, `E208`)
- Restart sound during sweep (`E109`, `E209`)

### Frequency Sweep (Ch. 1 only)
- Sweep Time values are accurate  (`S101`)
- Sweep Shift values are accurate - ascending (`S102`)
- Sweep Shift values are accurate - descending(`S103`)
- Modify Sweep Time during sweep (`S104`)
- Modify Sweep Direction during sweep (`S105`)
- Modify Sweep Shift value during sweep (`S106`)
- Restart sound during sweep (`S107`)

## Channel 3 - Waveform

### Wave RAM
- Waveform playback should be accurate at 100% volume (`W301`)
- Waveform playback should be accurate at 50% volume (`W302`)
- Waveform playback should be accurate at 25% volume (`W303`)
- Waveform playback should be muted at 0% volume (`W304`)
- Change volume during playback (`W305`)
- Playback of buffered long sound sample (`W306`)
- Sound should be enabled and disabled when the on/off flag is toggled (NR30 bit 7) (`W307`)
- When restarting the channel, playback should resume from the last sample in RAM (`W308`)

### Sound Length
- Sound plays indefinitely when counter is disabled (`L301`)
- Sound lengths are accurate (`L302`)
- Increase sound length during sound (`L303`)
- Decrease sound length during sound (`L304`)
- Disable Sound length during sound (`L305`)
- Enable Sound length during sound (`L306`)

### Frequency
- Frequency values are accurate  (`F301`)
- Modify frequency during sound (`F302`)

## Channel 4 - Noise

### Sound Length
- Sound plays indefinitely when counter is disabled (`L401`)
- Sound lengths are accurate (`L402`)
- Increase sound length during sound (`L403`)
- Decrease sound length during sound (`L404`)
- Disable Sound length during sound (`L405`)
- Enable Sound length during sound (`L406`)

### Volume Envelope
- Initial Volume values are accurate (volume sweep disabled)  (`E401`)
- Volume sweep ramp deltas are accurate (use slowest ramp, min/mid/max starting volumes) - ascending (`E402`)
- Volume sweep ramp deltas are accurate (use slowest ramp, min/mid/max starting volumes) - descending (`E403`)
- Volume sweep ramp slopes are accurate - ascending (`E404`)
- Volume sweep ramp slopes are accurate - descending (`E405`)
- Modify initial volume during sweep (`E406`)
- Modify ramp direction during sweep (`E407`)
- Modify ramp slope during sweep (`E408`)
- Restart sound during sweep (`E409`)

### Polynomial Counter
- Shift Clock Frequency values are accurate (`P401`)
- Counter step values are accurate (`P402`)
- Dividing Ratios values are accurate (`P403`)

## Output Terminal

- Modify output channel selection during sound - None, Left, Right, Both  (`OT01`)
- Modify Master volume during sound (`OT02`)
- Disable APU during sound (`0T03`)

## Omnibus

- Play all tests sequentially (`ALL0`)

# Building From Source

## Linux, Mac, Windows (Cygwin)

1. Install [rgbds](https://github.com/gbdev/rgbds)
2. `cd` into the cloned repo
3. Run `make`

