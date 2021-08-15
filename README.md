# tidal-drum-machines
 A huge collection of Drum Machines for SuperDirt and Tidal

### List of drum machines

See the full list of drum machines [here](/machines).

---

## How to use

Run the custom SuperCollider bootup found in [tdm-sc-boot.scd](/tdm-sc-boot.scd), or add the necessary parts to your own bootup. Then run the haskell/tidal code found in [tdm-hs-setup.tidal](/tdm-hs-setup.tidal), or just copy and paste it from here:

```hs
let drumMachine name ps = stack 
                    (map (\ x -> 
                        (# s (name ++| (extractS "s" (x)))) $ x
                        ) ps)
    drumFrom name drum = s (name ++| drum)
    drumM = drumMachine
    drumF = drumFrom
```

### Examples

Here are some examples of how to use the drum machines:

#### drumMachines

```hs
d1 $ drumMachine "bossdr220" [
    s "[~perc]*2" # note 7
    ,s "bd:4(3,8)"
    ,s "~[cp,sd]"
    ,s "hh*8"
]
```

The drum machine can be pattern'd:
```hs
d1 $ drumMachine "<bossdr220 rolandtr808>" [
    s "[~perc]*2" # note 7
    ,s "bd:4(3,8)"
    ,s "~[cp,sd]"
    ,s "hh*8"
]
```

#### drumFrom

You can also just call one percussive element:

```hs
d1 $ drumFrom "linn9000" "bd*2"
```

This method could be useful for live performance:
```hs
do
 let dm = "linn9000"
 d1 $ drumFrom dm "bd*2"
```

---

### Drum names abbreviations:
| Drum                                | Abbreviation |
|-------------------------------------|--------------|
| Bass drum, Kick drum                | bd           |
| Snare drum                          | sd           |
| Rimshot                             | rim          |
| Clap                                | cp           |
| Closed hi-hat                       | hh           |
| Open hi-hat                         | oh           |
| Crash                               | cr           |
| Ride                                | rd           |
| Shakers (and maracas, cabasas, etc) | sh           |
| High tom                            | ht           |
| Medium tom                          | mt           |
| Low tom                             | lt           |
| Cowbell                             | cb           |
| Tambourine                          | tb           |
| Other percussions                   | perc         |
| Miscellaneous samples               | misc         |
| Effects                             | fx           |
