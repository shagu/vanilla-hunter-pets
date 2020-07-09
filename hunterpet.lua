#!/usr/bin/lua
-- depends on luasql
local pets = {}

local models = {
  -- batskinbrown
  [14562] = "batskinbrown",
  [4732] = "batskinbrown",
  [4734] = "batskinbrown",
  [9535] = "batskinbrown",
  -- batskin
  [1954] = "batskin",
  [1955] = "batskin",
  [7896] = "batskin",
  -- batskinviolet
  [7894] = "batskinviolet",
  [7897] = "batskinviolet",
  [8808] = "batskinviolet",
  -- batskinwhite
  [4735] = "batskinwhite",
  [9750] = "batskinwhite",
  -- bearskinblackdiseased
  [1082] = "bearskinblackdiseased",
  -- bearskinblack
  [706] = "bearskinblack",
  [707] = "bearskinblack",
  [762] = "bearskinblack",
  [719] = "bearskinblack",
  [8843] = "bearskinblack",
  -- bearskinblue
  [1007] = "bearskinblue",
  [3200] = "bearskinblue",
  [3201] = "bearskinblue",
  [806] = "bearskinblue",
  [8838] = "bearskinblue",
  [8840] = "bearskinblue",
  -- bearskinbrown
  [1006] = "bearskinbrown",
  [902] = "bearskinbrown",
  [14315] = "bearskinbrown",
  [14316] = "bearskinbrown",
  [1990] = "bearskinbrown",
  [5510] = "bearskinbrown",
  [982] = "bearskinbrown",
  -- bearskindrkbrowndiseased
  [1083] = "bearskindrkbrowndiseased",
  [9276] = "bearskindrkbrowndiseased",
  [9277] = "bearskindrkbrowndiseased",
  -- bearskindrkbrown
  [820] = "bearskindrkbrown",
  -- bearskinwhite
  [10618] = "bearskinwhite",
  [865] = "bearskinwhite",
  [8837] = "bearskinwhite",
  [8842] = "bearskinwhite",
  [913] = "bearskinwhite",
  -- boarskinbluearmored
  [4714] = "boarskinbluearmored",
  -- boarskinblue
  [381] = "boarskinblue",
  [607] = "boarskinblue",
  [744] = "boarskinblue",
  [8870] = "boarskinblue",
  -- boarskinbrownarmored
  [4713] = "boarskinbrownarmored",
  -- boarskinbrown
  [1208] = "boarskinbrown",
  [377] = "boarskinbrown",
  [703] = "boarskinbrown",
  [704] = "boarskinbrown",
  -- boarskincrimson
  [3026] = "boarskincrimson",
  [3027] = "boarskincrimson",
  [3035] = "boarskincrimson",
  [6807] = "boarskincrimson",
  -- boarskinivoryarmored
  [2453] = "boarskinivoryarmored",
  -- boarskinivory
  [193] = "boarskinivory",
  [389] = "boarskinivory",
  [503] = "boarskinivory",
  -- boarskinundead
  [6121] = "boarskinundead",
  -- boarskinyellow
  [8869] = "boarskinyellow",
  [8871] = "boarskinyellow",
  -- carrionbirdskinblue
  [10273] = "carrionbirdskinblue",
  [10826] = "carrionbirdskinblue",
  [1192] = "carrionbirdskinblue",
  [14319] = "carrionbirdskinblue",
  [507] = "carrionbirdskinblue",
  -- carrionbirdskinbrown
  [10825] = "carrionbirdskinbrown",
  [2305] = "carrionbirdskinbrown",
  [410] = "carrionbirdskinbrown",
  -- carrionbirdskin
  [10824] = "carrionbirdskin",
  [1105] = "carrionbirdskin",
  [1106] = "carrionbirdskin",
  [1228] = "carrionbirdskin",
  [1229] = "carrionbirdskin",
  [388] = "carrionbirdskin",
  -- carrionbirdskinred
  [10827] = "carrionbirdskinred",
  [1210] = "carrionbirdskinred",
  [14313] = "carrionbirdskinred",
  [3248] = "carrionbirdskinred",
  [490] = "carrionbirdskinred",
  [7348] = "carrionbirdskinred",
  [7349] = "carrionbirdskinred",
  -- crabskinbronze
  [342] = "crabskinbronze",
  [699] = "crabskinbronze",
  [9570] = "crabskinbronze",
  [641] = "crabskinbronze",
  [9571] = "crabskinbronze",
  -- crabskinivory
  [1001] = "crabskinivory",
  [9565] = "crabskinivory",
  [981] = "crabskinivory",
  [999] = "crabskinivory",
  -- crabskinsaphire
  [1000] = "crabskinsaphire",
  [9566] = "crabskinsaphire",
  [9573] = "crabskinsaphire",
  [979] = "crabskinsaphire",
  -- crabskinvermillian
  [1307] = "crabskinvermillian",
  [1938] = "crabskinvermillian",
  -- crocodileskinalbino
  [2850] = "crocodileskinalbino",
  [2996] = "crocodileskinalbino",
  -- crocodileskinmarsh
  [1035] = "crocodileskinmarsh",
  [1036] = "crocodileskinmarsh",
  [1038] = "crocodileskinmarsh",
  [2548] = "crocodileskinmarsh",
  [2549] = "crocodileskinmarsh",
  [925] = "crocodileskinmarsh",
  -- crocodileskinriver
  [1039] = "crocodileskinriver",
  [1250] = "crocodileskinriver",
  [833] = "crocodileskinriver",
  -- crocodileskinswamp
  [1034] = "crocodileskinswamp",
  [1080] = "crocodileskinswamp",
  [807] = "crocodileskinswamp",
  [814] = "crocodileskinswamp",
  [815] = "crocodileskinswamp",
  [831] = "crocodileskinswamp",
  -- direwolfskindarkblack
  [11421] = "direwolfskindarkblack",
  [246] = "direwolfskindarkblack",
  [741] = "direwolfskindarkblack",
  [11411] = "direwolfskindarkblack",
  [9562] = "direwolfskindarkblack",
  [9563] = "direwolfskindarkblack",
  -- direwolfskindarkgrey
  [11414] = "direwolfskindarkgrey",
  -- direwolfskinlightblue
  [10278] = "direwolfskinlightblue",
  [11412] = "direwolfskinlightblue",
  [11422] = "direwolfskinlightblue",
  -- direwolfskinlightgrey
  [11413] = "direwolfskinlightgrey",
  [11415] = "direwolfskinlightgrey",
  [11417] = "direwolfskinlightgrey",
  [11418] = "direwolfskinlightgrey",
  [11419] = "direwolfskinlightgrey",
  -- direwolfskinreddishbrown
  [11420] = "direwolfskinreddishbrown",
  [9370] = "direwolfskinreddishbrown",
  [9371] = "direwolfskinreddishbrown",
  [9372] = "direwolfskinreddishbrown",
  -- gorillaskinblack
  [809] = "gorillaskinblack",
  [845] = "gorillaskinblack",
  [839] = "gorillaskinblack",
  -- gorillaskingrey
  [838] = "gorillaskingrey",
  [843] = "gorillaskingrey",
  -- gorillaskinred
  [3186] = "gorillaskinred",
  [3188] = "gorillaskinred",
  [8844] = "gorillaskinred",
  -- gorillaskinsilver
  [5244] = "gorillaskinsilver",
  [5294] = "gorillaskinsilver",
  [844] = "gorillaskinsilver",
  [837] = "gorillaskinsilver",
  -- gorillaskinwhite
  [8129] = "gorillaskinwhite",
  -- hyenaskinblack
  [10271] = "hyenaskinblack",
  [10902] = "hyenaskinblack",
  [2726] = "hyenaskinblack",
  -- hyenaskinblue
  [10903] = "hyenaskinblue",
  [10904] = "hyenaskinblue",
  [2713] = "hyenaskinblue",
  -- hyenaskin
  [1536] = "hyenaskin",
  -- hyenaskinoarnge
  [1534] = "hyenaskinoarnge",
  [1535] = "hyenaskinoarnge",
  [2609] = "hyenaskinoarnge",
  -- hyenaskinred
  [2709] = "hyenaskinred",
  -- hyenaskinwhite
  [2714] = "hyenaskinwhite",
  [2716] = "hyenaskinwhite",
  [8050] = "hyenaskinwhite",
  -- hyenaskinyellow
  [2710] = "hyenaskinyellow",
  [2711] = "hyenaskinyellow",
  [2712] = "hyenaskinyellow",
  -- lionessskingold
  [1933] = "lionessskingold",
  -- lionskinblack
  [4424] = "lionskinblack",
  -- lionskingold
  [1973] = "lionskingold",
  [1977] = "lionskingold",
  -- lionskinwhite
  [10114] = "lionskinwhite",
  [1934] = "lionskinwhite",
  -- minespiderskinblood
  [963] = "minespiderskinblood",
  -- minespiderskincave
  [1087] = "minespiderskincave",
  [1157] = "minespiderskincave",
  [14950] = "minespiderskincave",
  [955] = "minespiderskincave",
  [958] = "minespiderskincave",
  [959] = "minespiderskincave",
  -- minespiderskincrystal
  [4456] = "minespiderskincrystal",
  [9756] = "minespiderskincrystal",
  -- minespiderskingreen
  [2541] = "minespiderskingreen",
  [957] = "minespiderskingreen",
  [545] = "minespiderskingreen",
  -- minespiderskinjungle
  [2537] = "minespiderskinjungle",
  [2538] = "minespiderskinjungle",
  [2539] = "minespiderskinjungle",
  -- minespiderskinolive
  [1088] = "minespiderskinolive",
  [513] = "minespiderskinolive",
  -- minespiderskinsteel
  [30] = "minespiderskinsteel",
  [368] = "minespiderskinsteel",
  [418] = "minespiderskinsteel",
  -- minespiderskinwetlands
  [711] = "minespiderskinwetlands",
  [15136] = "minespiderskinwetlands",
  -- owlgrey
  [10829] = "owlgrey",
  [10830] = "owlgrey",
  [10831] = "owlgrey",
  [10832] = "owlgrey",
  [4877] = "owlgrey",
  -- owlwhite
  [10833] = "owlwhite",
  [6212] = "owlwhite",
  [10828] = "owlwhite",
  -- raptorskingrey
  [1337] = "raptorskingrey",
  [1746] = "raptorskingrey",
  -- raptorskinmottledbluegreen
  [677] = "raptorskinmottledbluegreen",
  [755] = "raptorskinmottledbluegreen",
  [8472] = "raptorskinmottledbluegreen",
  [949] = "raptorskinmottledbluegreen",
  -- raptorskinmottleddarkgreen
  [615] = "raptorskinmottleddarkgreen",
  [648] = "raptorskinmottleddarkgreen",
  -- raptorskinorange
  [180] = "raptorskinorange",
  [649] = "raptorskinorange",
  [670] = "raptorskinorange",
  [673] = "raptorskinorange",
  [788] = "raptorskinorange",
  -- raptorskinred
  [1959] = "raptorskinred",
  [1960] = "raptorskinred",
  [1962] = "raptorskinred",
  [2571] = "raptorskinred",
  [2574] = "raptorskinred",
  [2573] = "raptorskinred",
  [11315] = "raptorskinred",
  -- raptorskinviolet
  [11317] = "raptorskinviolet",
  [1744] = "raptorskinviolet",
  [1747] = "raptorskinviolet",
  [4442] = "raptorskinviolet",
  [960] = "raptorskinviolet",
  -- raptorskinyellow
  [11316] = "raptorskinyellow",
  [787] = "raptorskinyellow",
  [961] = "raptorskinyellow",
  -- ridingtigerskinaqua
  [10054] = "ridingtigerskinaqua",
  [10113] = "ridingtigerskinaqua",
  -- ridingtigerskinlavender
  [9954] = "ridingtigerskinlavender",
  -- scorpionskinbeige
  [2485] = "scorpionskinbeige",
  [2486] = "scorpionskinbeige",
  -- scorpionskinblack
  [2488] = "scorpionskinblack",
  [2491] = "scorpionskinblack",
  [2864] = "scorpionskinblack",
  [6068] = "scorpionskinblack",
  -- scorpionskinblue
  [2730] = "scorpionskinblue",
  [2731] = "scorpionskinblue",
  -- scorpionskingolden
  [15384] = "scorpionskingolden",
  [2729] = "scorpionskingolden",
  [2765] = "scorpionskingolden",
  [2766] = "scorpionskingolden",
  -- scorpionskinpink
  [10986] = "scorpionskinpink",
  [10987] = "scorpionskinpink",
  [2414] = "scorpionskinpink",
  -- scorpionskinred
  [3247] = "scorpionskinred",
  [5985] = "scorpionskinred",
  [7347] = "scorpionskinred",
  -- scorpionskinsilver
  [10983] = "scorpionskinsilver",
  [10988] = "scorpionskinsilver",
  [15383] = "scorpionskinsilver",
  [15385] = "scorpionskinsilver",
  -- scorpionskinyellow
  [10984] = "scorpionskinyellow",
  [10985] = "scorpionskinyellow",
  [2487] = "scorpionskinyellow",
  [2732] = "scorpionskinyellow",
  [8970] = "scorpionskinyellow",
  -- seaturtleskinblue
  [5126] = "seaturtleskinblue",
  [6368] = "seaturtleskinblue",
  [7114] = "seaturtleskinblue",
  [5127] = "seaturtleskinblue",
  -- seaturtleskingrey
  [7836] = "seaturtleskingrey",
  [7840] = "seaturtleskingrey",
  [4829] = "seaturtleskingrey",
  [7837] = "seaturtleskingrey",
  [7839] = "seaturtleskingrey",
  -- seaturtleskin
  [1244] = "seaturtleskin",
  -- seaturtleskinred
  [5026] = "seaturtleskinred",
  [5027] = "seaturtleskinred",
  -- seaturtleskinwhite
  [10947] = "seaturtleskinwhite",
  [2307] = "seaturtleskinwhite",
  [2308] = "seaturtleskinwhite",
  [5052] = "seaturtleskinwhite",
  -- tallstriderskinbrown
  [1042] = "tallstriderskinbrown",
  [1219] = "tallstriderskinbrown",
  [1283] = "tallstriderskinbrown",
  [178] = "tallstriderskinbrown",
  -- tallstriderskingray
  [1220] = "tallstriderskingray",
  [6076] = "tallstriderskingray",
  -- tallstriderskinivory
  [1221] = "tallstriderskinivory",
  [1284] = "tallstriderskinivory",
  -- tallstriderskinpink
  [1961] = "tallstriderskinpink",
  -- tallstriderskinturquoise
  [38] = "tallstriderskinturquoise",
  -- tarantulaskinbrown
  [520] = "tarantulaskinbrown",
  [8014] = "tarantulaskinbrown",
  [821] = "tarantulaskinbrown",
  [827] = "tarantulaskinbrown",
  -- tarantulaskingreen
  [1989] = "tarantulaskingreen",
  [336] = "tarantulaskingreen",
  [6808] = "tarantulaskingreen",
  [709] = "tarantulaskingreen",
  [759] = "tarantulaskingreen",
  [760] = "tarantulaskingreen",
  -- tarantulaskingrey
  [1091] = "tarantulaskingrey",
  [1103] = "tarantulaskingrey",
  [1104] = "tarantulaskingrey",
  [6214] = "tarantulaskingrey",
  -- tarantulaskinmagma
  [4457] = "tarantulaskinmagma",
  [4458] = "tarantulaskinmagma",
  [7510] = "tarantulaskinmagma",
  -- tarantulaskinorange
  [11348] = "tarantulaskinorange",
  [2542] = "tarantulaskinorange",
  [2424] = "tarantulaskinorange",
  [2543] = "tarantulaskinorange",
  [2546] = "tarantulaskinorange",
  [366] = "tarantulaskinorange",
  [382] = "tarantulaskinorange",
  -- tigerskinblack
  [11452] = "tigerskinblack",
  [14572] = "tigerskinblack",
  [2437] = "tigerskinblack",
  [599] = "tigerskinblack",
  [613] = "tigerskinblack",
  [633] = "tigerskinblack",
  -- tigerskinblackspotted
  [11448] = "tigerskinblackspotted",
  [11453] = "tigerskinblackspotted",
  [14318] = "tigerskinblackspotted",
  -- tigerskinblackstriped
  [11449] = "tigerskinblackstriped",
  [11450] = "tigerskinblackstriped",
  [321] = "tigerskinblackstriped",
  -- tigerskinbrown
  [1056] = "tigerskinbrown",
  [1058] = "tigerskinbrown",
  [1059] = "tigerskinbrown",
  [11451] = "tigerskinbrown",
  [2278] = "tigerskinbrown",
  [2300] = "tigerskinbrown",
  [6082] = "tigerskinbrown",
  -- tigerskindark
  [11454] = "tigerskindark",
  [3030] = "tigerskindark",
  [3031] = "tigerskindark",
  [6805] = "tigerskindark",
  -- tigerskinnostripewhite
  [11444] = "tigerskinnostripewhite",
  [11445] = "tigerskinnostripewhite",
  [9958] = "tigerskinnostripewhite",
  -- tigerskinred
  [11031] = "tigerskinred",
  [15151] = "tigerskinred",
  [320] = "tigerskinred",
  [471] = "tigerskinred",
  [598] = "tigerskinred",
  [614] = "tigerskinred",
  [698] = "tigerskinred",
  -- tigerskinsnow
  [748] = "tigerskinsnow",
  [954] = "tigerskinsnow",
  -- tigerskinsnow-transparent
  [4472] = "tigerskinsnow-transparent",
  -- tigerskinwhite
  [616] = "tigerskinwhite",
  [9953] = "tigerskinwhite",
  -- tigerskinyellow
  [1043] = "tigerskinyellow",
  [1055] = "tigerskinyellow",
  [632] = "tigerskinyellow",
  [917] = "tigerskinyellow",
  -- windserpentskinblack
  [3006] = "windserpentskinblack",
  [7829] = "windserpentskinblack",
  -- windserpentskingreen
  [10991] = "windserpentskingreen",
  [2700] = "windserpentskingreen",
  [2706] = "windserpentskingreen",
  [2707] = "windserpentskingreen",
  [2708] = "windserpentskingreen",
  [4091] = "windserpentskingreen",
  -- windserpentskin
  [1742] = "windserpentskin",
  [1974] = "windserpentskin",
  [1975] = "windserpentskin",
  [1336] = "windserpentskin",
  -- windserpentskinred
  [15275] = "windserpentskinred",
  [2702] = "windserpentskinred",
  [4065] = "windserpentskinred",
  [9913] = "windserpentskinred",
  -- windserpentskinred-oarnge
  [10183] = "windserpentskinred-oarnge",
  [2699] = "windserpentskinred-oarnge",
  [3204] = "windserpentskinred-oarnge",
  -- windserpentskinwhite
  [2703] = "windserpentskinwhite",
  [2705] = "windserpentskinwhite",
  [7569] = "windserpentskinwhite",
  -- wolfskinarctic
  [11416] = "wolfskinarctic",
  [1207] = "wolfskinarctic",
  [776] = "wolfskinarctic",
  [785] = "wolfskinarctic",
  [801] = "wolfskinarctic",
  [802] = "wolfskinarctic",
  [855] = "wolfskinarctic",
  -- wolfskinblack
  [780] = "wolfskinblack",
  [781] = "wolfskinblack",
  [782] = "wolfskinblack",
  -- wolfskincoyote
  [1100] = "wolfskincoyote",
  [1164] = "wolfskincoyote",
  [161] = "wolfskincoyote",
  [557] = "wolfskincoyote",
  [643] = "wolfskincoyote",
  -- wolfskindiseased
  [4124] = "wolfskindiseased",
  [9278] = "wolfskindiseased",
  [9280] = "wolfskindiseased",
  -- wolfskintimber
  [165] = "wolfskintimber",
  [3202] = "wolfskintimber",
  [3203] = "wolfskintimber",
  [380] = "wolfskintimber",
  [447] = "wolfskintimber",
  [604] = "wolfskintimber",
  [903] = "wolfskintimber",
}

local builds = {
  [4125] = "1.1.2",
  [4062] = "1.1.1",
  [4044] = "1.1.0",
  [4222] = "1.2.4",
  [4211] = "1.2.3",
  [4196] = "1.2.2",
  [4150] = "1.2.1",
  [4149] = "1.2.0",
  [4297] = "1.3.1",
  [4284] = "1.3.0",
  [4375] = "1.4.2",
  [4364] = "1.4.1",
  [4341] = "1.4.0",
  [4449] = "1.5.1",
  [4442] = "1.5.0",
  [4544] = "1.6.1",
  [4500] = "1.6.0",
  [4695] = "1.7.1",
  [4671] = "1.7.0",
  [4878] = "1.8.4",
  [4807] = "1.8.3",
  [4784] = "1.8.2",
  [4769] = "1.8.1",
  [4735] = "1.8.0",
  [5086] = "1.9.4",
  [5059] = "1.9.3",
  [4996] = "1.9.2",
  [4983] = "1.9.1",
  [4937] = "1.9.0",
  [5302] = "1.10.2",
  [5230] = "1.10.1",
  [5195] = "1.10",
  [5464] = "1.11.2",
  [5462] = "1.11.1",
  [5428] = "1.11",
  [5595] = "1.12",
  [5875] = "1.12.1",
  [6005] = "1.12.2",
}

local families = {
  [1] = "Wolf",
  [2] = "Cat",
  [3] = "Spider",
  [4] = "Bear",
  [5] = "Boar",
  [6] = "Crocolisk",
  [7] = "Carrion Bird",
  [8] = "Crab",
  [9] = "Gorilla",
  [11] = "Raptor",
  [12] = "Tallstrider",
  --[15] = "Felhunter",
  --[16] = "Voidwalker",
  --[17] = "Succubus",
  --[19] = "Doomguard",
  [20] = "Scorpid",
  [21] = "Turtle",
  --[23] = "Imp",
  [24] = "Bat",
  [25] = "Hyena",
  [26] = "Owl",
  [27] = "Wind Serpent",
  --[28] = "Remote Control",
}

local stats = {
  ["Bat"] = { 6, 0, 0, "Fruit, Fungus", "Bite, Dive, Screech" },
  ["Bear"] = { -9, 5, 8, "Bread, Cheese, Fruit, Fungus, Meat", "Bite, Claw" },
  ["Boar"] = { -10, 9, 4, "Bread, Cheese, Fish, Fruit, Fungus, Meat", "Bite, Charge, Dash" },
  ["Carrion Bird"] = { 0, 5, 0, "Fish, Meat", "Bite, Claw, Dive, Screech" },
  ["Cat"] = { 10, 0, -2, "Fish, Meat", "Bite, Claw, Dash, Prowl" },
  ["Crab"] = { -5, 13, -4, "Bread, Fish, Fruit, Fungus", "Claw" },
  ["Crocolisk"] = { 0, 10, -5, "Fish, Meat", "Bite" },
  ["Gorilla"] = { 2, 0, 4, "Fruit, Fungus", "Bite, Thunderstomp" },
  ["Hyena"] = { 0, 5, 0, "Fruit, Meat", "Bite, Dash" },
  ["Owl"] = { 7, 0, 0, "Meat", "Claw, Dive, Screech" },
  ["Raptor"] = { 10, 3, -5, "Meat", "Bite, Claw" },
  ["Scorpid"] = { -6, 10, 0, "Meat", "Claw, Scorpid Poison" },
  ["Spider"] = { 7, 0, 0, "Meat", "Bite" },
  ["Tallstrider"] = { 0, 0, 5, "Cheese, Fruit, Fungus", "Bite, Dash" },
  ["Turtle"] = { -10, 13, 0, "Fish, Fruit, Fungus, Raw Fish", "Bite, Shell Shield" },
  ["Wind Serpent"] = { 7, 0, 0, "Bread, Cheese, Fish", "Bite, Dive, Lightning Breath" },
  ["Wolf"] = { 0, 5, 0, "Meat", "Bite, Dash, Furious Howl" },
}

local luasql = require("luasql.mysql").mysql()
local mysql = luasql:connect("vmangos-vanilla","mangos","mangos","127.0.0.1")

do -- helper functions
  -- http://lua-users.org/wiki/SortedIteration
  function __genOrderedIndex( t )
    local orderedIndex = {}
    for key in pairs(t) do
      table.insert( orderedIndex, key )
    end
    table.sort( orderedIndex )
    return orderedIndex
  end

  function orderedNext(t, state)
    local key = nil
    if state == nil then
      t.__orderedIndex = __genOrderedIndex( t )
      key = t.__orderedIndex[1]
    else
      for i = 1,#t.__orderedIndex do
        if t.__orderedIndex[i] == state then
          key = t.__orderedIndex[i+1]
        end
      end
    end

    if key then
      return key, t[key]
    end

    t.__orderedIndex = nil
    return
  end

  function opairs(t)
      return orderedNext, t, nil
  end
end

do -- database
  local creature_template = {}
  local query = mysql:execute([[
    SELECT entry, name, base_attack_time, rank, display_id1, beast_family, level_min, level_max, spell_list_id, pet_spell_list_id FROM `creature_template` WHERE ( type_flags & 1) AND beast_family > 0 GROUP BY entry ORDER BY beast_family, level_min, level_max, name
  ]])

  while query:fetch(creature_template, "a") do
    local entry = tonumber(creature_template.entry)
    local spells = tonumber(creature_template.pet_spell_list_id)
    local min = tonumber(creature_template.level_min)
    local max = tonumber(creature_template.level_max)
    local family = creature_template.beast_family
    local attackspeed = tonumber(creature_template.base_attack_time)/1000
    local rank = tonumber(creature_template.rank)

    if rank > 0 and rank < 5 then
      rank = rank == 1 and "Elite" or rank
      rank = rank == 2 and "Rare Elite" or rank
      rank = rank == 3 and "Boss" or rank
      rank = rank == 4 and "Rare" or rank
    else
      rank = ""
    end

    local tableid = #pets + 1

    pets[tableid] = pets[tableid] or {}
    pets[tableid].name = creature_template.name
    pets[tableid].family = creature_template.beast_family
    pets[tableid].level = min ~= max and min .. "-" .. max or min
    pets[tableid].id = entry
    pets[tableid].model = tonumber(creature_template.display_id1)
    pets[tableid].attackspeed = attackspeed
    pets[tableid].rank = rank

    if spells > 0 then
      local pet_spell_data = {}
      local query = mysql:execute([[
        SELECT * FROM `pet_spell_data` WHERE entry = ]] .. spells .. [[ ORDER BY build
      ]])

      while query:fetch(pet_spell_data, "a") do
        for i=1,4 do
          local spell = tonumber(pet_spell_data["spell_id"..i])
          if spell > 0 then
            pets[tableid].spells = pets[tableid].spells or {}
            pets[tableid].spells[pet_spell_data.build] = pets[tableid].spells[pet_spell_data.build] or {}

            local spell_template = {}
            local query = mysql:execute([[SELECT entry, build, name, nameSubtext FROM `spell_template` WHERE entry =]] .. spell .. [[ AND build >= ]] .. pet_spell_data.build)
            while query:fetch(spell_template, "a") do
              pets[tableid].spells[pet_spell_data.build][spell_template.name .. " " .. spell_template.nameSubtext] = spell
            end
          end
        end
      end
    end
  end
end

do -- css
  print([[
  <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,600&display=swap" rel="stylesheet" />
  <style>
    body, html {
      margin: auto;
      margin-top: 20px;
      width: 90%;
      background: #222222;
      color: #ffffff;
      font-family: Roboto;
    }

    div img {
      background-image: none;
      height: 40px;
      float: right;
      margin: 5px;
      border-radius: 3px;
      transition: transform .2s;
    }

    span.credits {
      display: block;
      margin: 20px 0px;
      padding: 20px;
      text-align: center;
      border: 1px #333333 solid;
      background: #2a2a2a;
      font-size: 14pt;
    }

    span.credits a {
      color: #ffffff;
      text-decoration: none;
      font-weight: 600;
    }

    span.credits a:hover {
      color: #33ffcc;
      text-decoration: underline;
    }

    div.family {
      margin-top: 50px;
      maring-bottom: 5px;
      padding: 10px;
      font-size: 22pt;
      font-weight: bold;
      border-bottom: 1px #888888 dashed;
      color: #ffffff;
    }

    div.pet {
      margin: 5px;
      background: #333333;
      border: 1px #444444 solid;
      color: #000000;
    }

    div.pet:hover {
      background: #3a3a3a;
      border: 1px #888888 solid;
    }

    div.pet:hover img {
      transform: scale(4);
    }

    span.name {
      display: block;
      padding: 5px;
    }

    span.name a {
      color: #33ffcc;
      text-decoration: none;
      font-size: 14pt;
    }

    span.name a:hover {
      text-decoration: underline;
    }

    span.subtext {
      display: inline-block;
      color: #ffffff;
      padding: 0px 5px 0px 5px;
    }

    div.build {
      margin: 5px;
      background: #444444;
      color: #ffffff;
    }

    span.build {
      display: inline-block;
      width: 100px;
      font-size: 11pt;
      background: #666666;
    }

    span.spell {
      margin: 5px;
    }
    span.spell a {
      color: #ffff00;
      text-decoration: none;
    }

    span.spell a:hover {
      text-decoration: underline;
    }

    h1 {
      padding: 5px;
      color: #ffffff;
      font-weight: 100;
      padding-top: 10px;
      font-size: 36pt;
      border-bottom: 1px #33ffcc solid;
    }

    a.scrollup {
      display: block;
      position: fixed;
      bottom: 20px;
      right: 30px;
      text-decoration: none;
      z-index: 99;
      font-size: 18px;
      border: none;
      outline: none;
      background-color: #333333;
      border: 1px #444444 solid;
      color: #ffffff;
      cursor: pointer;
      padding: 15px;
      border-radius: 4px;
    }

    span.model {
      font-size: 10pt;
      color: #cccccc;
    }

    a.scrollup:hover {
      background-color: #444444;
      border: 1px #666666 solid;
    }

    td {
      padding: 5px;
    }

    td.neutral {
      color: #ffff55;
    }

    td.good {
      color: #55ff55;
    }

    td.bad {
      color: #ff5555;
    }

    td.title {
      font-weight: bold;
      background: #333333;
    }

    td {
      border: 1px #444444 solid;
      min-width: 100px;
    }

    td a {
      color: #ffffff;
      text-decoration: none;
    }

    td a:hover {
      text-decoration: underline;
    }

    tr:hover {
      background: #333333;
    }
  </style>
  ]])
end

do -- html
  print([[
    <a id="0" style="margin:auto;float: right; height: 20px;" href="https://shagu.org"><img src="https://raw.githubusercontent.com/shagu/shagu.org/master/_layouts/logo.png"/></a>
    <a href="#0" class="scrollup">Scroll Up</a>
    <h1>Vanilla WoW Hunter Pets</h1>
    <span class="credits">Made with <span style='color: #ffaaaa'>❤️</span> for <a href="https://gurubashi.org/">Gurubashi-WoW</a>. Based on the <a href="https://github.com/vmangos">VMaNGOS</a> database and <a href="https://www.wow-petopia.com/">Petopia</a> images. Source code hosted on <a href="https://github.com/shagu/vanilla-hunter-pets">GitHub</a></span>
  ]])
end

do -- stats
  print([[
    <table width=100%>
      <tr>
        <td class="title" width=200>Family</td>
        <td class="title">Damage</td>
        <td class="title">Armor</td>
        <td class="title">Health</td>
        <td class="title">Diet</td>
        <td class="title">Skills</td>
      </tr>
  ]])

  for id, name in pairs(families) do
    if stats[name] then
      local stats = stats[name]

      local damage = stats[1] > 0 and "good" or stats[1] < 0 and "bad" or "neutral"
      local damageval = stats[1] > 0 and "+"..stats[1].."%" or stats[1] < 0 and stats[1].."%" or stats[1].."%"

      local armor = stats[2] > 0 and "good" or stats[2] < 0 and "bad" or "neutral"
      local armorval = stats[2] > 0 and "+"..stats[2].."%" or stats[2] < 0 and stats[2].."%" or stats[2].."%"

      local health = stats[3] > 0 and "good" or stats[3] < 0 and "bad" or "neutral"
      local healthval = stats[3] > 0 and "+"..stats[3].."%" or stats[3] < 0 and stats[3].."%" or stats[3].."%"

      print("<tr>")
      print("  <td><a href='#" .. id .. "'>" .. name .. "</a></td>")
      print("  <td class='" .. damage .. "'>" .. damageval .. "</td>")
      print("  <td class='" .. armor .. "'>" .. armorval .. "</td>")
      print("  <td class='" .. health .. "'>" .. healthval .. "</td>")
      print("  <td>" .. stats[4] .. "</td>")
      print("  <td>" .. stats[5] .. "</td>")
      print("</tr>")
    end
  end

  print([[
    </table>
  ]])
end

do -- iterate beasts
  local lastfamily = 0
  for id, data in opairs(pets) do
    if data.family ~= lastfamily then
      print("<div class='family' id='" .. data.family .. "'>Pet Family: " .. families[tonumber(data.family)] .. "</div>")
      lastfamily = data.family
    end

    print("<div class='pet'>")

    local model = models[data.model] or "' height=200 style='height: 200 !important;"

    --print("<img src='https://classicdb.ch/models/" ..  data.model .. ".gif' onerror=\"this.src='https://classicdb.ch/modelviewer/thumbs/npc/" ..  data.model .. ".png'\"/>")
    print("<img src='img/" ..  model .. ".jpg'/>")
    print("<span class='name'><a href='https://classicdb.ch/?npc=" .. data.id .. "'>" .. data.name .. "</a> <span class='model'>(Model: " .. data.model .. ")</span></span>")
    print("<span class='subtext'>Level: <b>" .. data.level .. "</b>" .. ( data.rank ~= "" and " (<span style='color: #ffaaaa;font-weight: bold;'>" .. data.rank .. "</span>)" or "") .. "</span>")
    print("<span class='subtext'>Attack Speed: <b>" .. data.attackspeed .. "</b></span>")
    if data.spells then
      for build, spelltbl in opairs(data.spells) do
        print("<div class='build'>")
        print("<span class='build'>" .. (builds[tonumber(build)] and "Patch " .. builds[tonumber(build)] or "All Patches") .. "</span>")
        for spell, spellid in opairs(spelltbl) do
          print("<span class='spell'><a href='https://classicdb.ch/?spell=" .. spellid .. "'>[" .. spell .. "]</a></span>")
        end
        print("</div>")
      end
    end
    print("</div>")
  end
end
