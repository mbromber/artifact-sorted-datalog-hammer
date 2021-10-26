(set-logic UFLIRA)
(set-info :status unknown)
(declare-fun IgnTable (Real Real Real Real Real ) Bool)
(declare-fun Tmp (Real Real ) Bool)
(declare-fun KPa (Real Real ) Bool)
(declare-fun Rpm (Real Real ) Bool)
(declare-fun IgnDeg1 (Real Real Real Real Real ) Bool)
(declare-fun ResultDeg (Real Real ) Bool)
(declare-fun GC0 () Real)
(declare-fun GC1 () Real)
(assert (and 
(IgnTable 0 13 0 660 2020) 
(IgnTable 0 13 660 880 2050) 
(IgnTable 0 13 880 1100 2020) 
(IgnTable 0 13 1100 1320 2090) 
(IgnTable 0 13 1320 1540 2230) 
(IgnTable 0 13 1540 1760 2440) 
(IgnTable 0 13 1760 1980 2760) 
(IgnTable 0 13 1980 2200 2940) 
(IgnTable 0 13 2200 2420 3040) 
(IgnTable 0 13 2420 2640 3220) 
(IgnTable 0 13 2640 2860 3430) 
(IgnTable 0 13 2860 3080 3580) 
(IgnTable 0 13 3080 3300 3580) 
(IgnTable 0 13 3300 3520 3610) 
(IgnTable 0 13 3520 3740 3650) 
(IgnTable 0 13 3740 3960 3680) 
(IgnTable 0 13 3960 4180 3680) 
(IgnTable 0 13 4180 4400 3680) 
(IgnTable 0 13 4400 4620 3680) 
(IgnTable 0 13 4620 4840 3790) 
(IgnTable 0 13 4840 5060 3820) 
(IgnTable 0 13 5060 5280 3790) 
(IgnTable 0 13 5280 5500 3790) 
(IgnTable 0 13 5500 5720 3860) 
(IgnTable 0 13 5720 5940 3860) 
(IgnTable 0 13 5940 6160 3860) 
(IgnTable 0 13 6160 6380 4040) 
(IgnTable 0 13 6380 6600 4040) 
(IgnTable 0 13 6600 6820 4140) 
(IgnTable 0 13 6820 7040 4140) 
(IgnTable 0 13 7040 7260 4140) 
(IgnTable 0 13 7260 7480 4140) 
(IgnTable 0 13 7480 7700 4140) 
(IgnTable 0 13 7700 7920 4140) 
(IgnTable 0 13 7920 8140 4140) 
(IgnTable 0 13 8140 8360 4140) 
(IgnTable 0 13 8360 8580 4140) 
(IgnTable 13 26 0 660 1520) 
(IgnTable 13 26 660 880 1560) 
(IgnTable 13 26 880 1100 1590) 
(IgnTable 13 26 1100 1320 1880) 
(IgnTable 13 26 1320 1540 2090) 
(IgnTable 13 26 1540 1760 2440) 
(IgnTable 13 26 1760 1980 2580) 
(IgnTable 13 26 1980 2200 2660) 
(IgnTable 13 26 2200 2420 2800) 
(IgnTable 13 26 2420 2640 2870) 
(IgnTable 13 26 2640 2860 3080) 
(IgnTable 13 26 2860 3080 3330) 
(IgnTable 13 26 3080 3300 3400) 
(IgnTable 13 26 3300 3520 3330) 
(IgnTable 13 26 3520 3740 3330) 
(IgnTable 13 26 3740 3960 3400) 
(IgnTable 13 26 3960 4180 3400) 
(IgnTable 13 26 4180 4400 3400) 
(IgnTable 13 26 4400 4620 3500) 
(IgnTable 13 26 4620 4840 3500) 
(IgnTable 13 26 4840 5060 3580) 
(IgnTable 13 26 5060 5280 3610) 
(IgnTable 13 26 5280 5500 3650) 
(IgnTable 13 26 5500 5720 3720) 
(IgnTable 13 26 5720 5940 3720) 
(IgnTable 13 26 5940 6160 3680) 
(IgnTable 13 26 6160 6380 3820) 
(IgnTable 13 26 6380 6600 3860) 
(IgnTable 13 26 6600 6820 4040) 
(IgnTable 13 26 6820 7040 4040) 
(IgnTable 13 26 7040 7260 4040) 
(IgnTable 13 26 7260 7480 4040) 
(IgnTable 13 26 7480 7700 4040) 
(IgnTable 13 26 7700 7920 4040) 
(IgnTable 13 26 7920 8140 4040) 
(IgnTable 13 26 8140 8360 4040) 
(IgnTable 13 26 8360 8580 4040) 
(IgnTable 26 39 0 660 1030) 
(IgnTable 26 39 660 880 1240) 
(IgnTable 26 39 880 1100 1450) 
(IgnTable 26 39 1100 1320 1910) 
(IgnTable 26 39 1320 1540 2190) 
(IgnTable 26 39 1540 1760 2550) 
(IgnTable 26 39 1760 1980 2660) 
(IgnTable 26 39 1980 2200 2830) 
(IgnTable 26 39 2200 2420 2940) 
(IgnTable 26 39 2420 2640 2970) 
(IgnTable 26 39 2640 2860 3010) 
(IgnTable 26 39 2860 3080 3010) 
(IgnTable 26 39 3080 3300 3040) 
(IgnTable 26 39 3300 3520 3010) 
(IgnTable 26 39 3520 3740 3120) 
(IgnTable 26 39 3740 3960 3150) 
(IgnTable 26 39 3960 4180 3150) 
(IgnTable 26 39 4180 4400 3150) 
(IgnTable 26 39 4400 4620 3260) 
(IgnTable 26 39 4620 4840 3150) 
(IgnTable 26 39 4840 5060 3220) 
(IgnTable 26 39 5060 5280 3290) 
(IgnTable 26 39 5280 5500 3400) 
(IgnTable 26 39 5500 5720 3430) 
(IgnTable 26 39 5720 5940 3500) 
(IgnTable 26 39 5940 6160 3400) 
(IgnTable 26 39 6160 6380 3580) 
(IgnTable 26 39 6380 6600 3610) 
(IgnTable 26 39 6600 6820 3790) 
(IgnTable 26 39 6820 7040 3790) 
(IgnTable 26 39 7040 7260 3790) 
(IgnTable 26 39 7260 7480 3790) 
(IgnTable 26 39 7480 7700 3790) 
(IgnTable 26 39 7700 7920 3790) 
(IgnTable 26 39 7920 8140 3790) 
(IgnTable 26 39 8140 8360 3790) 
(IgnTable 26 39 8360 8580 3790) 
(IgnTable 39 52 0 660 960) 
(IgnTable 39 52 660 880 1240) 
(IgnTable 39 52 880 1100 1630) 
(IgnTable 39 52 1100 1320 2050) 
(IgnTable 39 52 1320 1540 2270) 
(IgnTable 39 52 1540 1760 2370) 
(IgnTable 39 52 1760 1980 2620) 
(IgnTable 39 52 1980 2200 2800) 
(IgnTable 39 52 2200 2420 2800) 
(IgnTable 39 52 2420 2640 2730) 
(IgnTable 39 52 2640 2860 2730) 
(IgnTable 39 52 2860 3080 2730) 
(IgnTable 39 52 3080 3300 2730) 
(IgnTable 39 52 3300 3520 2730) 
(IgnTable 39 52 3520 3740 2730) 
(IgnTable 39 52 3740 3960 2800) 
(IgnTable 39 52 3960 4180 2800) 
(IgnTable 39 52 4180 4400 2800) 
(IgnTable 39 52 4400 4620 2800) 
(IgnTable 39 52 4620 4840 2830) 
(IgnTable 39 52 4840 5060 2870) 
(IgnTable 39 52 5060 5280 2870) 
(IgnTable 39 52 5280 5500 2940) 
(IgnTable 39 52 5500 5720 2970) 
(IgnTable 39 52 5720 5940 3040) 
(IgnTable 39 52 5940 6160 3010) 
(IgnTable 39 52 6160 6380 3220) 
(IgnTable 39 52 6380 6600 3260) 
(IgnTable 39 52 6600 6820 3400) 
(IgnTable 39 52 6820 7040 3400) 
(IgnTable 39 52 7040 7260 3400) 
(IgnTable 39 52 7260 7480 3400) 
(IgnTable 39 52 7480 7700 3400) 
(IgnTable 39 52 7700 7920 3400) 
(IgnTable 39 52 7920 8140 3400) 
(IgnTable 39 52 8140 8360 3400) 
(IgnTable 39 52 8360 8580 3400) 
(IgnTable 52 65 0 660 670) 
(IgnTable 52 65 660 880 1350) 
(IgnTable 52 65 880 1100 1660) 
(IgnTable 52 65 1100 1320 1950) 
(IgnTable 52 65 1320 1540 2190) 
(IgnTable 52 65 1540 1760 2340) 
(IgnTable 52 65 1760 1980 2340) 
(IgnTable 52 65 1980 2200 2340) 
(IgnTable 52 65 2200 2420 2270) 
(IgnTable 52 65 2420 2640 2300) 
(IgnTable 52 65 2640 2860 2410) 
(IgnTable 52 65 2860 3080 2510) 
(IgnTable 52 65 3080 3300 2510) 
(IgnTable 52 65 3300 3520 2510) 
(IgnTable 52 65 3520 3740 2480) 
(IgnTable 52 65 3740 3960 2410) 
(IgnTable 52 65 3960 4180 2370) 
(IgnTable 52 65 4180 4400 2270) 
(IgnTable 52 65 4400 4620 2340) 
(IgnTable 52 65 4620 4840 2340) 
(IgnTable 52 65 4840 5060 2370) 
(IgnTable 52 65 5060 5280 2440) 
(IgnTable 52 65 5280 5500 2510) 
(IgnTable 52 65 5500 5720 2550) 
(IgnTable 52 65 5720 5940 2620) 
(IgnTable 52 65 5940 6160 2620) 
(IgnTable 52 65 6160 6380 2830) 
(IgnTable 52 65 6380 6600 2970) 
(IgnTable 52 65 6600 6820 3040) 
(IgnTable 52 65 6820 7040 3040) 
(IgnTable 52 65 7040 7260 3040) 
(IgnTable 52 65 7260 7480 3040) 
(IgnTable 52 65 7480 7700 3040) 
(IgnTable 52 65 7700 7920 3040) 
(IgnTable 52 65 7920 8140 3040) 
(IgnTable 52 65 8140 8360 3040) 
(IgnTable 52 65 8360 8580 3040) 
(IgnTable 65 78 0 660 530) 
(IgnTable 65 78 660 880 990) 
(IgnTable 65 78 880 1100 1380) 
(IgnTable 65 78 1100 1320 1490) 
(IgnTable 65 78 1320 1540 1660) 
(IgnTable 65 78 1540 1760 1770) 
(IgnTable 65 78 1760 1980 1770) 
(IgnTable 65 78 1980 2200 1840) 
(IgnTable 65 78 2200 2420 1880) 
(IgnTable 65 78 2420 2640 1880) 
(IgnTable 65 78 2640 2860 1980) 
(IgnTable 65 78 2860 3080 2090) 
(IgnTable 65 78 3080 3300 2090) 
(IgnTable 65 78 3300 3520 2120) 
(IgnTable 65 78 3520 3740 2020) 
(IgnTable 65 78 3740 3960 1880) 
(IgnTable 65 78 3960 4180 1880) 
(IgnTable 65 78 4180 4400 1880) 
(IgnTable 65 78 4400 4620 1980) 
(IgnTable 65 78 4620 4840 1980) 
(IgnTable 65 78 4840 5060 2050) 
(IgnTable 65 78 5060 5280 2120) 
(IgnTable 65 78 5280 5500 2160) 
(IgnTable 65 78 5500 5720 2190) 
(IgnTable 65 78 5720 5940 2230) 
(IgnTable 65 78 5940 6160 2340) 
(IgnTable 65 78 6160 6380 2580) 
(IgnTable 65 78 6380 6600 2660) 
(IgnTable 65 78 6600 6820 2730) 
(IgnTable 65 78 6820 7040 2730) 
(IgnTable 65 78 7040 7260 2730) 
(IgnTable 65 78 7260 7480 2730) 
(IgnTable 65 78 7480 7700 2730) 
(IgnTable 65 78 7700 7920 2730) 
(IgnTable 65 78 7920 8140 2730) 
(IgnTable 65 78 8140 8360 2730) 
(IgnTable 65 78 8360 8580 2730) 
(IgnTable 78 91 0 660 530) 
(IgnTable 78 91 660 880 810) 
(IgnTable 78 91 880 1100 850) 
(IgnTable 78 91 1100 1320 990) 
(IgnTable 78 91 1320 1540 1100) 
(IgnTable 78 91 1540 1760 1420) 
(IgnTable 78 91 1760 1980 1630) 
(IgnTable 78 91 1980 2200 1560) 
(IgnTable 78 91 2200 2420 1560) 
(IgnTable 78 91 2420 2640 1660) 
(IgnTable 78 91 2640 2860 1770) 
(IgnTable 78 91 2860 3080 1770) 
(IgnTable 78 91 3080 3300 1660) 
(IgnTable 78 91 3300 3520 1590) 
(IgnTable 78 91 3520 3740 1630) 
(IgnTable 78 91 3740 3960 1770) 
(IgnTable 78 91 3960 4180 1770) 
(IgnTable 78 91 4180 4400 1770) 
(IgnTable 78 91 4400 4620 1770) 
(IgnTable 78 91 4620 4840 1770) 
(IgnTable 78 91 4840 5060 1880) 
(IgnTable 78 91 5060 5280 1840) 
(IgnTable 78 91 5280 5500 1840) 
(IgnTable 78 91 5500 5720 1980) 
(IgnTable 78 91 5720 5940 2050) 
(IgnTable 78 91 5940 6160 2050) 
(IgnTable 78 91 6160 6380 2230) 
(IgnTable 78 91 6380 6600 2270) 
(IgnTable 78 91 6600 6820 2370) 
(IgnTable 78 91 6820 7040 2370) 
(IgnTable 78 91 7040 7260 2370) 
(IgnTable 78 91 7260 7480 2370) 
(IgnTable 78 91 7480 7700 2370) 
(IgnTable 78 91 7700 7920 2370) 
(IgnTable 78 91 7920 8140 2370) 
(IgnTable 78 91 8140 8360 2370) 
(IgnTable 78 91 8360 8580 2370) 
(IgnTable 91 104 0 660 460) 
(IgnTable 91 104 660 880 600) 
(IgnTable 91 104 880 1100 600) 
(IgnTable 91 104 1100 1320 740) 
(IgnTable 91 104 1320 1540 1030) 
(IgnTable 91 104 1540 1760 1170) 
(IgnTable 91 104 1760 1980 1350) 
(IgnTable 91 104 1980 2200 1350) 
(IgnTable 91 104 2200 2420 1420) 
(IgnTable 91 104 2420 2640 1450) 
(IgnTable 91 104 2640 2860 1490) 
(IgnTable 91 104 2860 3080 1560) 
(IgnTable 91 104 3080 3300 1560) 
(IgnTable 91 104 3300 3520 1660) 
(IgnTable 91 104 3520 3740 1730) 
(IgnTable 91 104 3740 3960 1810) 
(IgnTable 91 104 3960 4180 1910) 
(IgnTable 91 104 4180 4400 2050) 
(IgnTable 91 104 4400 4620 1880) 
(IgnTable 91 104 4620 4840 1770) 
(IgnTable 91 104 4840 5060 1840) 
(IgnTable 91 104 5060 5280 1840) 
(IgnTable 91 104 5280 5500 1980) 
(IgnTable 91 104 5500 5720 1980) 
(IgnTable 91 104 5720 5940 1980) 
(IgnTable 91 104 5940 6160 2050) 
(IgnTable 91 104 6160 6380 2190) 
(IgnTable 91 104 6380 6600 2090) 
(IgnTable 91 104 6600 6820 2160) 
(IgnTable 91 104 6820 7040 2090) 
(IgnTable 91 104 7040 7260 2020) 
(IgnTable 91 104 7260 7480 1980) 
(IgnTable 91 104 7480 7700 1980) 
(IgnTable 91 104 7700 7920 1980) 
(IgnTable 91 104 7920 8140 1980) 
(IgnTable 91 104 8140 8360 1980) 
(IgnTable 91 104 8360 8580 1980) 
(IgnTable 104 117 0 660 460) 
(IgnTable 104 117 660 880 600) 
(IgnTable 104 117 880 1100 600) 
(IgnTable 104 117 1100 1320 710) 
(IgnTable 104 117 1320 1540 960) 
(IgnTable 104 117 1540 1760 1100) 
(IgnTable 104 117 1760 1980 1240) 
(IgnTable 104 117 1980 2200 1240) 
(IgnTable 104 117 2200 2420 1310) 
(IgnTable 104 117 2420 2640 1420) 
(IgnTable 104 117 2640 2860 1450) 
(IgnTable 104 117 2860 3080 1520) 
(IgnTable 104 117 3080 3300 1560) 
(IgnTable 104 117 3300 3520 1630) 
(IgnTable 104 117 3520 3740 1630) 
(IgnTable 104 117 3740 3960 1630) 
(IgnTable 104 117 3960 4180 1770) 
(IgnTable 104 117 4180 4400 1880) 
(IgnTable 104 117 4400 4620 1810) 
(IgnTable 104 117 4620 4840 1700) 
(IgnTable 104 117 4840 5060 1730) 
(IgnTable 104 117 5060 5280 1770) 
(IgnTable 104 117 5280 5500 1880) 
(IgnTable 104 117 5500 5720 1910) 
(IgnTable 104 117 5720 5940 1910) 
(IgnTable 104 117 5940 6160 2020) 
(IgnTable 104 117 6160 6380 2160) 
(IgnTable 104 117 6380 6600 2090) 
(IgnTable 104 117 6600 6820 2090) 
(IgnTable 104 117 6820 7040 2050) 
(IgnTable 104 117 7040 7260 2020) 
(IgnTable 104 117 7260 7480 1980) 
(IgnTable 104 117 7480 7700 1950) 
(IgnTable 104 117 7700 7920 1950) 
(IgnTable 104 117 7920 8140 1950) 
(IgnTable 104 117 8140 8360 1950) 
(IgnTable 104 117 8360 8580 1950) 
(IgnTable 117 130 0 660 460) 
(IgnTable 117 130 660 880 600) 
(IgnTable 117 130 880 1100 600) 
(IgnTable 117 130 1100 1320 710) 
(IgnTable 117 130 1320 1540 920) 
(IgnTable 117 130 1540 1760 1100) 
(IgnTable 117 130 1760 1980 1240) 
(IgnTable 117 130 1980 2200 1240) 
(IgnTable 117 130 2200 2420 1310) 
(IgnTable 117 130 2420 2640 1420) 
(IgnTable 117 130 2640 2860 1450) 
(IgnTable 117 130 2860 3080 1520) 
(IgnTable 117 130 3080 3300 1560) 
(IgnTable 117 130 3300 3520 1630) 
(IgnTable 117 130 3520 3740 1630) 
(IgnTable 117 130 3740 3960 1630) 
(IgnTable 117 130 3960 4180 1770) 
(IgnTable 117 130 4180 4400 1880) 
(IgnTable 117 130 4400 4620 1810) 
(IgnTable 117 130 4620 4840 1730) 
(IgnTable 117 130 4840 5060 1730) 
(IgnTable 117 130 5060 5280 1770) 
(IgnTable 117 130 5280 5500 1880) 
(IgnTable 117 130 5500 5720 1910) 
(IgnTable 117 130 5720 5940 1910) 
(IgnTable 117 130 5940 6160 2020) 
(IgnTable 117 130 6160 6380 2160) 
(IgnTable 117 130 6380 6600 2090) 
(IgnTable 117 130 6600 6820 2090) 
(IgnTable 117 130 6820 7040 2050) 
(IgnTable 117 130 7040 7260 2020) 
(IgnTable 117 130 7260 7480 1980) 
(IgnTable 117 130 7480 7700 1950) 
(IgnTable 117 130 7700 7920 1950) 
(IgnTable 117 130 7920 8140 1950) 
(IgnTable 117 130 8140 8360 1950) 
(IgnTable 117 130 8360 8580 1950) 
(IgnTable 130 143 0 660 460) 
(IgnTable 130 143 660 880 600) 
(IgnTable 130 143 880 1100 600) 
(IgnTable 130 143 1100 1320 710) 
(IgnTable 130 143 1320 1540 920) 
(IgnTable 130 143 1540 1760 1100) 
(IgnTable 130 143 1760 1980 1240) 
(IgnTable 130 143 1980 2200 1240) 
(IgnTable 130 143 2200 2420 1310) 
(IgnTable 130 143 2420 2640 1420) 
(IgnTable 130 143 2640 2860 1450) 
(IgnTable 130 143 2860 3080 1520) 
(IgnTable 130 143 3080 3300 1560) 
(IgnTable 130 143 3300 3520 1630) 
(IgnTable 130 143 3520 3740 1630) 
(IgnTable 130 143 3740 3960 1630) 
(IgnTable 130 143 3960 4180 1770) 
(IgnTable 130 143 4180 4400 1880) 
(IgnTable 130 143 4400 4620 1810) 
(IgnTable 130 143 4620 4840 1730) 
(IgnTable 130 143 4840 5060 1730) 
(IgnTable 130 143 5060 5280 1770) 
(IgnTable 130 143 5280 5500 1880) 
(IgnTable 130 143 5500 5720 1910) 
(IgnTable 130 143 5720 5940 1910) 
(IgnTable 130 143 5940 6160 2020) 
(IgnTable 130 143 6160 6380 2160) 
(IgnTable 130 143 6380 6600 2090) 
(IgnTable 130 143 6600 6820 2090) 
(IgnTable 130 143 6820 7040 2050) 
(IgnTable 130 143 7040 7260 2020) 
(IgnTable 130 143 7260 7480 1980) 
(IgnTable 130 143 7480 7700 1950) 
(IgnTable 130 143 7700 7920 1950) 
(IgnTable 130 143 7920 8140 1950) 
(IgnTable 130 143 8140 8360 1950) 
(IgnTable 130 143 8360 8580 1950) 
(IgnTable 143 156 0 660 460) 
(IgnTable 143 156 660 880 600) 
(IgnTable 143 156 880 1100 600) 
(IgnTable 143 156 1100 1320 710) 
(IgnTable 143 156 1320 1540 920) 
(IgnTable 143 156 1540 1760 1100) 
(IgnTable 143 156 1760 1980 1240) 
(IgnTable 143 156 1980 2200 1240) 
(IgnTable 143 156 2200 2420 1270) 
(IgnTable 143 156 2420 2640 1420) 
(IgnTable 143 156 2640 2860 1450) 
(IgnTable 143 156 2860 3080 1490) 
(IgnTable 143 156 3080 3300 1560) 
(IgnTable 143 156 3300 3520 1630) 
(IgnTable 143 156 3520 3740 1630) 
(IgnTable 143 156 3740 3960 1630) 
(IgnTable 143 156 3960 4180 1770) 
(IgnTable 143 156 4180 4400 1880) 
(IgnTable 143 156 4400 4620 1810) 
(IgnTable 143 156 4620 4840 1730) 
(IgnTable 143 156 4840 5060 1730) 
(IgnTable 143 156 5060 5280 1770) 
(IgnTable 143 156 5280 5500 1880) 
(IgnTable 143 156 5500 5720 1910) 
(IgnTable 143 156 5720 5940 1910) 
(IgnTable 143 156 5940 6160 2020) 
(IgnTable 143 156 6160 6380 2160) 
(IgnTable 143 156 6380 6600 2090) 
(IgnTable 143 156 6600 6820 2090) 
(IgnTable 143 156 6820 7040 2050) 
(IgnTable 143 156 7040 7260 2020) 
(IgnTable 143 156 7260 7480 1980) 
(IgnTable 143 156 7480 7700 1950) 
(IgnTable 143 156 7700 7920 1950) 
(IgnTable 143 156 7920 8140 1950) 
(IgnTable 143 156 8140 8360 1950) 
(IgnTable 143 156 8360 8580 1950) 
(IgnTable 156 169 0 660 460) 
(IgnTable 156 169 660 880 600) 
(IgnTable 156 169 880 1100 600) 
(IgnTable 156 169 1100 1320 710) 
(IgnTable 156 169 1320 1540 920) 
(IgnTable 156 169 1540 1760 1100) 
(IgnTable 156 169 1760 1980 1240) 
(IgnTable 156 169 1980 2200 1240) 
(IgnTable 156 169 2200 2420 1310) 
(IgnTable 156 169 2420 2640 1420) 
(IgnTable 156 169 2640 2860 1450) 
(IgnTable 156 169 2860 3080 1490) 
(IgnTable 156 169 3080 3300 1560) 
(IgnTable 156 169 3300 3520 1630) 
(IgnTable 156 169 3520 3740 1630) 
(IgnTable 156 169 3740 3960 1630) 
(IgnTable 156 169 3960 4180 1700) 
(IgnTable 156 169 4180 4400 1770) 
(IgnTable 156 169 4400 4620 1810) 
(IgnTable 156 169 4620 4840 1700) 
(IgnTable 156 169 4840 5060 1730) 
(IgnTable 156 169 5060 5280 1770) 
(IgnTable 156 169 5280 5500 1880) 
(IgnTable 156 169 5500 5720 1910) 
(IgnTable 156 169 5720 5940 1910) 
(IgnTable 156 169 5940 6160 2020) 
(IgnTable 156 169 6160 6380 2050) 
(IgnTable 156 169 6380 6600 2050) 
(IgnTable 156 169 6600 6820 2050) 
(IgnTable 156 169 6820 7040 2050) 
(IgnTable 156 169 7040 7260 2020) 
(IgnTable 156 169 7260 7480 1980) 
(IgnTable 156 169 7480 7700 1950) 
(IgnTable 156 169 7700 7920 1950) 
(IgnTable 156 169 7920 8140 1950) 
(IgnTable 156 169 8140 8360 1950) 
(IgnTable 156 169 8360 8580 1950) 
(IgnTable 169 182 0 660 460) 
(IgnTable 169 182 660 880 600) 
(IgnTable 169 182 880 1100 600) 
(IgnTable 169 182 1100 1320 710) 
(IgnTable 169 182 1320 1540 920) 
(IgnTable 169 182 1540 1760 1060) 
(IgnTable 169 182 1760 1980 1200) 
(IgnTable 169 182 1980 2200 1200) 
(IgnTable 169 182 2200 2420 1270) 
(IgnTable 169 182 2420 2640 1380) 
(IgnTable 169 182 2640 2860 1450) 
(IgnTable 169 182 2860 3080 1490) 
(IgnTable 169 182 3080 3300 1520) 
(IgnTable 169 182 3300 3520 1590) 
(IgnTable 169 182 3520 3740 1590) 
(IgnTable 169 182 3740 3960 1590) 
(IgnTable 169 182 3960 4180 1700) 
(IgnTable 169 182 4180 4400 1660) 
(IgnTable 169 182 4400 4620 1560) 
(IgnTable 169 182 4620 4840 1560) 
(IgnTable 169 182 4840 5060 1630) 
(IgnTable 169 182 5060 5280 1810) 
(IgnTable 169 182 5280 5500 2090) 
(IgnTable 169 182 5500 5720 2120) 
(IgnTable 169 182 5720 5940 1950) 
(IgnTable 169 182 5940 6160 1840) 
(IgnTable 169 182 6160 6380 2300) 
(IgnTable 169 182 6380 6600 2340) 
(IgnTable 169 182 6600 6820 2300) 
(IgnTable 169 182 6820 7040 1910) 
(IgnTable 169 182 7040 7260 2300) 
(IgnTable 169 182 7260 7480 2230) 
(IgnTable 169 182 7480 7700 2190) 
(IgnTable 169 182 7700 7920 2190) 
(IgnTable 169 182 7920 8140 2190) 
(IgnTable 169 182 8140 8360 2190) 
(IgnTable 169 182 8360 8580 2190) 
(IgnTable 182 195 0 660 460) 
(IgnTable 182 195 660 880 600) 
(IgnTable 182 195 880 1100 600) 
(IgnTable 182 195 1100 1320 710) 
(IgnTable 182 195 1320 1540 920) 
(IgnTable 182 195 1540 1760 1030) 
(IgnTable 182 195 1760 1980 1170) 
(IgnTable 182 195 1980 2200 1170) 
(IgnTable 182 195 2200 2420 1240) 
(IgnTable 182 195 2420 2640 1350) 
(IgnTable 182 195 2640 2860 1420) 
(IgnTable 182 195 2860 3080 1450) 
(IgnTable 182 195 3080 3300 1490) 
(IgnTable 182 195 3300 3520 1560) 
(IgnTable 182 195 3520 3740 1560) 
(IgnTable 182 195 3740 3960 1560) 
(IgnTable 182 195 3960 4180 1700) 
(IgnTable 182 195 4180 4400 1810) 
(IgnTable 182 195 4400 4620 1770) 
(IgnTable 182 195 4620 4840 1660) 
(IgnTable 182 195 4840 5060 1660) 
(IgnTable 182 195 5060 5280 1810) 
(IgnTable 182 195 5280 5500 2120) 
(IgnTable 182 195 5500 5720 2120) 
(IgnTable 182 195 5720 5940 2090) 
(IgnTable 182 195 5940 6160 2160) 
(IgnTable 182 195 6160 6380 2050) 
(IgnTable 182 195 6380 6600 1700) 
(IgnTable 182 195 6600 6820 1730) 
(IgnTable 182 195 6820 7040 1880) 
(IgnTable 182 195 7040 7260 2230) 
(IgnTable 182 195 7260 7480 2190) 
(IgnTable 182 195 7480 7700 2160) 
(IgnTable 182 195 7700 7920 2160) 
(IgnTable 182 195 7920 8140 2160) 
(IgnTable 182 195 8140 8360 2160) 
(IgnTable 182 195 8360 8580 2160) 
(IgnTable 195 208 0 660 460) 
(IgnTable 195 208 660 880 600) 
(IgnTable 195 208 880 1100 600) 
(IgnTable 195 208 1100 1320 710) 
(IgnTable 195 208 1320 1540 920) 
(IgnTable 195 208 1540 1760 990) 
(IgnTable 195 208 1760 1980 1100) 
(IgnTable 195 208 1980 2200 1100) 
(IgnTable 195 208 2200 2420 1130) 
(IgnTable 195 208 2420 2640 1240) 
(IgnTable 195 208 2640 2860 1310) 
(IgnTable 195 208 2860 3080 1380) 
(IgnTable 195 208 3080 3300 1420) 
(IgnTable 195 208 3300 3520 1450) 
(IgnTable 195 208 3520 3740 1450) 
(IgnTable 195 208 3740 3960 1450) 
(IgnTable 195 208 3960 4180 1560) 
(IgnTable 195 208 4180 4400 1700) 
(IgnTable 195 208 4400 4620 1630) 
(IgnTable 195 208 4620 4840 1520) 
(IgnTable 195 208 4840 5060 1520) 
(IgnTable 195 208 5060 5280 1660) 
(IgnTable 195 208 5280 5500 1980) 
(IgnTable 195 208 5500 5720 2020) 
(IgnTable 195 208 5720 5940 2020) 
(IgnTable 195 208 5940 6160 2090) 
(IgnTable 195 208 6160 6380 2120) 
(IgnTable 195 208 6380 6600 2120) 
(IgnTable 195 208 6600 6820 2120) 
(IgnTable 195 208 6820 7040 2120) 
(IgnTable 195 208 7040 7260 2090) 
(IgnTable 195 208 7260 7480 2050) 
(IgnTable 195 208 7480 7700 2020) 
(IgnTable 195 208 7700 7920 2020) 
(IgnTable 195 208 7920 8140 2020) 
(IgnTable 195 208 8140 8360 2020) 
(IgnTable 195 208 8360 8580 2020) 
(IgnTable 208 221 0 660 460) 
(IgnTable 208 221 660 880 600) 
(IgnTable 208 221 880 1100 600) 
(IgnTable 208 221 1100 1320 710) 
(IgnTable 208 221 1320 1540 920) 
(IgnTable 208 221 1540 1760 960) 
(IgnTable 208 221 1760 1980 1060) 
(IgnTable 208 221 1980 2200 1030) 
(IgnTable 208 221 2200 2420 1100) 
(IgnTable 208 221 2420 2640 1170) 
(IgnTable 208 221 2640 2860 1240) 
(IgnTable 208 221 2860 3080 1310) 
(IgnTable 208 221 3080 3300 1350) 
(IgnTable 208 221 3300 3520 1420) 
(IgnTable 208 221 3520 3740 1420) 
(IgnTable 208 221 3740 3960 1420) 
(IgnTable 208 221 3960 4180 1490) 
(IgnTable 208 221 4180 4400 1590) 
(IgnTable 208 221 4400 4620 1520) 
(IgnTable 208 221 4620 4840 1450) 
(IgnTable 208 221 4840 5060 1450) 
(IgnTable 208 221 5060 5280 1490) 
(IgnTable 208 221 5280 5500 1590) 
(IgnTable 208 221 5500 5720 1630) 
(IgnTable 208 221 5720 5940 1630) 
(IgnTable 208 221 5940 6160 1730) 
(IgnTable 208 221 6160 6380 1730) 
(IgnTable 208 221 6380 6600 1730) 
(IgnTable 208 221 6600 6820 1730) 
(IgnTable 208 221 6820 7040 1730) 
(IgnTable 208 221 7040 7260 1730) 
(IgnTable 208 221 7260 7480 1700) 
(IgnTable 208 221 7480 7700 1660) 
(IgnTable 208 221 7700 7920 1660) 
(IgnTable 208 221 7920 8140 1660) 
(IgnTable 208 221 8140 8360 1660) 
(IgnTable 208 221 8360 8580 1660) 
(IgnTable 221 234 0 660 460) 
(IgnTable 221 234 660 880 600) 
(IgnTable 221 234 880 1100 600) 
(IgnTable 221 234 1100 1320 710) 
(IgnTable 221 234 1320 1540 920) 
(IgnTable 221 234 1540 1760 920) 
(IgnTable 221 234 1760 1980 990) 
(IgnTable 221 234 1980 2200 960) 
(IgnTable 221 234 2200 2420 1030) 
(IgnTable 221 234 2420 2640 1130) 
(IgnTable 221 234 2640 2860 1170) 
(IgnTable 221 234 2860 3080 1240) 
(IgnTable 221 234 3080 3300 1270) 
(IgnTable 221 234 3300 3520 1350) 
(IgnTable 221 234 3520 3740 1350) 
(IgnTable 221 234 3740 3960 1350) 
(IgnTable 221 234 3960 4180 1450) 
(IgnTable 221 234 4180 4400 1560) 
(IgnTable 221 234 4400 4620 1490) 
(IgnTable 221 234 4620 4840 1420) 
(IgnTable 221 234 4840 5060 1420) 
(IgnTable 221 234 5060 5280 1450) 
(IgnTable 221 234 5280 5500 1560) 
(IgnTable 221 234 5500 5720 1590) 
(IgnTable 221 234 5720 5940 1590) 
(IgnTable 221 234 5940 6160 1700) 
(IgnTable 221 234 6160 6380 1700) 
(IgnTable 221 234 6380 6600 1700) 
(IgnTable 221 234 6600 6820 1700) 
(IgnTable 221 234 6820 7040 1700) 
(IgnTable 221 234 7040 7260 1700) 
(IgnTable 221 234 7260 7480 1660) 
(IgnTable 221 234 7480 7700 1630) 
(IgnTable 221 234 7700 7920 1630) 
(IgnTable 221 234 7920 8140 1630) 
(IgnTable 221 234 8140 8360 1630) 
(IgnTable 221 234 8360 8580 1630) 
(IgnTable 234 247 0 660 460) 
(IgnTable 234 247 660 880 600) 
(IgnTable 234 247 880 1100 600) 
(IgnTable 234 247 1100 1320 710) 
(IgnTable 234 247 1320 1540 920) 
(IgnTable 234 247 1540 1760 890) 
(IgnTable 234 247 1760 1980 960) 
(IgnTable 234 247 1980 2200 920) 
(IgnTable 234 247 2200 2420 990) 
(IgnTable 234 247 2420 2640 1100) 
(IgnTable 234 247 2640 2860 1130) 
(IgnTable 234 247 2860 3080 1200) 
(IgnTable 234 247 3080 3300 1240) 
(IgnTable 234 247 3300 3520 1310) 
(IgnTable 234 247 3520 3740 1310) 
(IgnTable 234 247 3740 3960 1310) 
(IgnTable 234 247 3960 4180 1420) 
(IgnTable 234 247 4180 4400 1520) 
(IgnTable 234 247 4400 4620 1450) 
(IgnTable 234 247 4620 4840 1380) 
(IgnTable 234 247 4840 5060 1380) 
(IgnTable 234 247 5060 5280 1420) 
(IgnTable 234 247 5280 5500 1520) 
(IgnTable 234 247 5500 5720 1560) 
(IgnTable 234 247 5720 5940 1560) 
(IgnTable 234 247 5940 6160 1660) 
(IgnTable 234 247 6160 6380 1660) 
(IgnTable 234 247 6380 6600 1660) 
(IgnTable 234 247 6600 6820 1660) 
(IgnTable 234 247 6820 7040 1660) 
(IgnTable 234 247 7040 7260 1660) 
(IgnTable 234 247 7260 7480 1630) 
(IgnTable 234 247 7480 7700 1590) 
(IgnTable 234 247 7700 7920 1590) 
(IgnTable 234 247 7920 8140 1590) 
(IgnTable 234 247 8140 8360 1590) 
(IgnTable 234 247 8360 8580 1590) 
(IgnTable 247 260 0 660 460) 
(IgnTable 247 260 660 880 600) 
(IgnTable 247 260 880 1100 600) 
(IgnTable 247 260 1100 1320 710) 
(IgnTable 247 260 1320 1540 920) 
(IgnTable 247 260 1540 1760 890) 
(IgnTable 247 260 1760 1980 920) 
(IgnTable 247 260 1980 2200 890) 
(IgnTable 247 260 2200 2420 960) 
(IgnTable 247 260 2420 2640 1060) 
(IgnTable 247 260 2640 2860 1100) 
(IgnTable 247 260 2860 3080 1170) 
(IgnTable 247 260 3080 3300 1200) 
(IgnTable 247 260 3300 3520 1270) 
(IgnTable 247 260 3520 3740 1270) 
(IgnTable 247 260 3740 3960 1270) 
(IgnTable 247 260 3960 4180 1380) 
(IgnTable 247 260 4180 4400 1490) 
(IgnTable 247 260 4400 4620 1420) 
(IgnTable 247 260 4620 4840 1350) 
(IgnTable 247 260 4840 5060 1350) 
(IgnTable 247 260 5060 5280 1380) 
(IgnTable 247 260 5280 5500 1490) 
(IgnTable 247 260 5500 5720 1520) 
(IgnTable 247 260 5720 5940 1520) 
(IgnTable 247 260 5940 6160 1630) 
(IgnTable 247 260 6160 6380 1630) 
(IgnTable 247 260 6380 6600 1630) 
(IgnTable 247 260 6600 6820 1630) 
(IgnTable 247 260 6820 7040 1630) 
(IgnTable 247 260 7040 7260 1630) 
(IgnTable 247 260 7260 7480 1590) 
(IgnTable 247 260 7480 7700 1560) 
(IgnTable 247 260 7700 7920 1560) 
(IgnTable 247 260 7920 8140 1560) 
(IgnTable 247 260 8140 8360 1560) 
(IgnTable 247 260 8360 8580 1560) 
(forall ((x0 Real) )(=> (and (<= (- 30) x0) (<= x0 130) ) (Tmp x0 x0) ))
(forall ((x0 Real) )(=> (and (<= 0 x0) (<= x0 260) ) (KPa x0 x0) ))
(forall ((x0 Real) )(=> (and (<= 0 x0) (<= x0 8580) ) (Rpm x0 x0) ))
(forall ((x0 Real) (x1 Real) (x2 Real) (x3 Real) (x4 Real) (x5 Real) (x6 Real) (x7 Real) (x8 Real) )(=> (and (<= x0 x1) (< x1 x2) (<= x3 x4) (< x4 x5) (KPa x6 x1) (Rpm x7 x4) (IgnTable x0 x2 x3 x5 x8) ) (IgnDeg1 x6 x7 x1 x4 x8) ))
(forall ((x0 Real) (x1 Real) (x2 Real) (x3 Real) (x4 Real) )(=> (and (<= 0 x0) (< x0 8580) (<= 0 x1) (< x1 260) (IgnDeg1 x2 x3 x1 x0 x4) ) (ResultDeg x0 x1) ))
(=> (> 0 GC0) false)
(=> (>= GC0 8580) false)
(=> (> 0 GC1) false)
(=> (>= GC1 260) false)
(=> (ResultDeg GC0 GC1) false)
))
(check-sat)
(exit)