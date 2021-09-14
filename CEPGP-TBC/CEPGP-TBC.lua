local L = LibStub("AceLocale-3.0"):GetLocale("CEPGP-TBC");

do
	local TBC_Bosses = {
		[1] = {
			[1] = L["Karazhan"], -- Localised display name for raid instance
			[2] = "Karazhan", -- used for frame creation
			[3] = {
				-- Boss name, EncounterID, Internal name for frame creation, Default EP award
				[1] = {L["Attumen the Huntsman"], 652, "Attumen", 15},
				[2] = {L["Moroes"], 653, "Moroes", 15},
				[3] = {L["Maiden of Virtue"], 654, "Maiden", 15},
				[4] = {L["Opera Hall"], 655, "Opera", 15},
				[5] = {L["The Curator"], 656, "Curator", 15},
				[6] = {L["Terestian Illhoof"], 657, "Terestian", 15},
				[7] = {L["Shade of Aran"], 658, "ShadeofAran", 15},
				[8] = {L["Netherspite"], 659, "Netherspite", 15},
				[9] = {L["Chess Event"], 660, "Chess", 15},
				[10] = {L["Prince Malchezaar"], 661, "Malchezaar", 15},
				[11] = {L["Nightbane"], 662, "Nightbane", 17}
			}			
		},
		[2] = {
			[1] = L["Gruul's Lair"],
			[2] = "Gruul",
			[3] = {
				[1] = {L["High King Maulgar"], 649, "Maulgar", 15},
				[2] = {L["Gruul the Dragonkiller"], 650, "Gruul", 17}
			}
		},
		[3] = {
			[1] = L["Magtheridon's Lair"],
			[2] = "Magtheridon",
			[3] = {
				[1] = {L["Magtheridon"], 651, "Magtheridon", 17}
			}
		},
		[4] = {
			[1] = L["Serpentshrine Cavern"],
			[2] = "SSC",
			[3] = {
				[1] = {L["Hydross the Unstable"], 623, "Hydross", 17},
				[2] = {L["The Lurker Below"], 624, "Lurker", 17},
				[3] = {L["Leotheras the Blind"], 625, "Leotheras", 17},
				[4] = {L["Fathom-Lord Karathress"], 626, "Karathress", 17},
				[5] = {L["Morogrim Tidewalker"], 627, "Morogrim", 17},
				[6] = {L["Lady Vashj"], 628, "Vashj", 20}
			}
		},
		[5] = {
			[1] = L["The Eye"],
			[2] = "TheEye",
			[3] = {
				[1] = {L["Al'ar"], 730, "Alar", 17},
				[2] = {L["Void Reaver"], 731, "VoidReaver", 17},
				[3] = {L["High Astromancer Solarian"], 732, "Solarian", 17},
				[4] = {L["Kael'thas Sunstrider"], 733, "Kaelthas", 20}
			}
		},
		[6] = {
			[1] = L["Battle for Mount Hyjal"],
			[2] = "Hyjal",
			[3] = {
				[1] = {L["Rage Winterchill"], 618, "Winterchill", 20},
				[2] = {L["Anetheron"], 619, "Anetheron", 20},
				[3] = {L["Kaz'rogal"], 620, "Kazrogal", 20},
				[4] = {L["Azgalor"], 621, "Azgalor", 20},
				[5] = {L["Archimonde"], 622, "Archimonde", 22}
			}
		},
		[7] = {
			[1] = L["Black Temple"],
			[2] = "BT",
			[3] = {
				[1] = {L["High Warlord Naj'entus"], 601, "Najentus", 20},
				[2] = {L["Supremus"], 602, "Supremus", 20},
				[3] = {L["Shade of Akama"], 603, "Akama", 20},
				[4] = {L["Teron Gorefiend"], 604, "Gorefiend", 20},
				[5] = {L["Gurtogg Bloodboil"], 605, "Gurtogg", 20},
				[6] = {L["Reliquary of Souls"], 606, "Reliquary", 20},
				[7] = {L["Mother Shahraz"], 607, "Shahraz", 20},
				[8] = {L["The Illidari Council"], 608, "IllidariCouncil", 20},
				[9] = {L["Illidan Stormrage"], 609, "Illidan", 22}
			}
		},
		[8] = {
			[1] = L["Zul'Aman"],
			[2] = "ZA",
			[3] = {
				[1] = {L["Akil'zon"], 1189, "Akil'zon", 17},
				[2] = {L["Nalorakk"], 1190, "Nalorakk", 17},
				[3] = {L["Jan'alai"], 1191, "Jan'alai", 17},
				[4] = {L["Halazzi"], 1192, "Halazzi", 17},
				[5] = {L["Hex Lord Malacrass"], 1193, "Hex Lord Malacrass", 17},
				[6] = {L["Zul'jin"], 1194, "Zul'jin", 20},
			}
		},
		[9] = {
			[1] = L["Sunwell Plateau"],
			[2] = "Sunwell",
			[3] = {
				[1] = {L["Kalecgos"], 724, "Kalecgos", 22},
				[2] = {L["Brutallus"], 725, "Brutallus", 22},
				[3] = {L["Felmyst"], 726, "Felmyst", 22},
				[4] = {L["Eredar Twins"], 727, "EredarTwins", 22},
				[5] = {L["M'uru"], 728, "Muru", 22},
				[6] = {L["Kil'jaeden"], 729, "Kiljaeden", 24}
			}
		}	
	}
	
	-- Inject TBC goodness into CEPGP

	for _, j in ipairs(TBC_Bosses) do
		CEPGP.GP.RaidModifiers[j[1]] = CEPGP.GP.RaidModifiers[j[1]] or 100
		for _, v in ipairs(j[3]) do
			CEPGP_EncounterInfo.ID[v[2]] = v[1];
			CEPGP_EncounterInfo.Bosses[v[1]] = v[4];
			CEPGP.EP.BossEP[v[1]] = CEPGP.EP.BossEP[v[1]] or v[4];
			if CEPGP.EP.AutoAward[v[1]] == nil then
				CEPGP.EP.AutoAward[v[1]] = true;
			end
		end		
	end
	
	CEPGP_ItemDomain[L["Karazhan"]] = {
		21903, 21904, 22545, 22559, 22560, 22561, 23809, 28453, 28454, 28477, 28502, 28503, 28504, 28505, 28506, 28507, 28508, 28509, 28510, 28511, 28512, 28514, 28515, 28516, 28517, 28518, 28519, 28520, 28521, 28522, 28524, 28525, 28528, 28529, 28530, 28545, 28565, 28566, 28567, 28569, 28570, 28572, 28573, 28578, 28579, 28581, 28582, 28583, 28584, 28585, 28586, 28587, 28588, 28589, 28590, 28591, 28593, 28594, 28597, 28599, 28600, 28601, 28602, 28603, 28604, 28606, 28608, 28609, 28610, 28611, 28612, 28621, 28631, 28633, 28647, 28649, 28652, 28653, 28654, 28655, 28656, 28657, 28658, 28660, 28661, 28662, 28663, 28666, 28669, 28670, 28671, 28672, 28673, 28674, 28675, 28726, 28727, 28728, 28729, 28730, 28731, 28732, 28733, 28734, 28735, 28740, 28741, 28742, 28743, 28744, 28745, 28746, 28747, 28748, 28749, 28750, 28751, 28752, 28753, 28754, 28755, 28756, 28757, 28762, 28763, 28764, 28765, 28766, 28767, 28768, 28770, 28771, 28772, 28773, 28785, 29756, 29757, 29758, 29759, 29760, 29761, 30480, 30641, 30642, 30643, 30644, 30666, 30667, 30668, 30673, 30674, 30675, 30676, 30677, 30678, 30680, 30681, 30682, 30683, 30684, 30685, 30686, 30687
	};
	CEPGP_ItemDomain[L["Gruul's Lair"]] = {
		28794, 28795, 28796, 28797, 28799, 28800, 28801, 28802, 28803, 28804, 28810, 28822, 28823, 28824, 28825, 28827, 28828, 28830, 29762, 29763, 29764, 29765, 29766, 29767
	};
	CEPGP_ItemDomain[L["Magtheridon's Lair"]] = {
		28774, 28775, 28776, 28777, 28778, 28779, 28780, 28781, 28782, 28783, 28789, 29458, 34845, 29753, 29754, 29755, 32385, 32386
	};
	CEPGP_ItemDomain[L["Serpentshrine Cavern"]] = {
		30239, 30240, 30241, 30242, 30243, 30244, 30245, 30246, 30247, 30008, 30021, 30022, 30027, 30047, 30048, 30049, 30050, 30052, 30053, 30054, 30055, 30056, 30057, 30058, 30059, 30060, 30061, 30062, 30064, 30065, 30066, 30067, 30068, 30075, 30079, 30080, 30081, 30082, 30083, 30084, 30085, 30090, 30091, 30092, 30095, 30096, 30097, 30098, 30099, 30100, 30101, 30102, 30103, 30104, 30105, 30106, 30107, 30108, 30109, 30110, 30111, 30112, 30620, 30621, 30626, 30627, 30629, 30663, 30664, 30665, 30720, 32516, 33054, 33055, 33058
	};
	CEPGP_ItemDomain[L["The Eye"]] = {
		30236, 30237, 30238, 30248, 30249, 30250, 32405, 32458, 29918, 29920, 29921, 29922, 29923, 29924, 29925, 29947, 29948, 29949, 29950, 29951, 29962, 29965, 29966, 29972, 29976, 29977, 29981, 29982, 29983, 29984, 29985, 29986, 29987, 29988, 29989, 29990, 29991, 29992, 29993, 29994, 29995, 29996, 29997, 29998, 30020, 30024, 30026, 30028, 30029, 30030, 30446, 30447, 30448, 30449, 30450, 30619, 32267, 32515, 32944
	};
	CEPGP_ItemDomain[L["Battle for Mount Hyjal"]] = {
		31092, 31093, 31094, 31095, 31096, 31097, 30861, 30862, 30863, 30864, 30865, 30866, 30868, 30869, 30870, 30871, 30872, 30873, 30874, 30878, 30879, 30880, 30881, 30882, 30883, 30884, 30885, 30886, 30887, 30888, 30889, 30891, 30892, 30893, 30894, 30895, 30896, 30897, 30898, 30899, 30900, 30901, 30902, 30903, 30904, 30905, 30906, 30907, 30908, 30909, 30910, 30911, 30912, 30913, 30914, 30915, 30916, 30917, 30918, 30919, 32589, 32590, 32591, 32592, 32609, 32945, 32946, 34009, 34010
	};
	CEPGP_ItemDomain[L["Black Temple"]] = {
		31089, 31090, 31091, 31098, 31099, 31100, 31101, 31102, 31103, 32232, 32234, 32235, 32236, 32237, 32238, 32239, 32240, 32241, 32242, 32243, 32245, 32247, 32248, 32250, 32251, 32252, 32253, 32254, 32255, 32256, 32258, 32259, 32260, 32261, 32262, 32263, 32264, 32265, 32266, 32268, 32269, 32270, 32271, 32273, 32275, 32276, 32278, 32279, 32280, 32323, 32324, 32325, 32327, 32328, 32329, 32331, 32332, 32333, 32334, 32335, 32336, 32337, 32338, 32339, 32340, 32341, 32342, 32343, 32344, 32345, 32346, 32347, 32348, 32349, 32350, 32351, 32352, 32353, 32354, 32361, 32362, 32363, 32365, 32366, 32367, 32369, 32370, 32373, 32374, 32375, 32376, 32377, 32471, 32483, 32496, 32497, 32500, 32501, 32505, 32510, 32512, 32513, 32517, 32518, 32519, 32521, 32524, 32525, 32526, 32527, 32528, 32593, 32606, 32608, 32837, 32838, 32943, 34011, 34012
	};
	CEPGP_ItemDomain[L["Zul'Aman"]] = {
		33102, 33191, 33203, 33206, 33211, 33214, 33215, 33216, 33281, 33283, 33285, 33286, 33293, 33297, 33298, 33299, 33300, 33303, 33317, 33322, 33326, 33327, 33328, 33329, 33332, 33354, 33356, 33357, 33388, 33389, 33421, 33432, 33453, 33463, 33464, 33465, 33466, 33467, 33468, 33469, 33471, 33473, 33474, 33476, 33478, 33479, 33480, 33481, 33483, 33489, 33490, 33491, 33492, 33493, 33494, 33495, 33496, 33497, 33498, 33499, 33500, 33533, 33590, 33591, 33592, 33640, 33805, 33809, 33828, 33829, 33830, 33831, 33971, 34029
	};
	CEPGP_ItemDomain[L["Sunwell Plateau"]] = {
		34848, 34851, 34852, 34853, 34854, 34855, 34856, 34857, 34858, 34176, 34177, 34178, 34179, 34180, 34181, 34182, 34183, 34184, 34185, 34186, 34188, 34189, 34190, 34192, 34193, 34194, 34195, 34196, 34197, 34198, 34199, 34202, 34203, 34204, 34205, 34206, 34208, 34209, 34210, 34211, 34212, 34213, 34214, 34215, 34216, 34228, 34229, 34230, 34231, 34232, 34233, 34234, 34240, 34241, 34242, 34243, 34244, 34245, 34247, 34329, 34331, 34332, 34333, 34334, 34335, 34336, 34337, 34339, 34340, 34341, 34342, 34343, 34344, 34345, 34346, 34347, 34348, 34350, 34351, 34352, 34427, 34428, 34429, 34430, 35282, 35283, 35284, 35290, 35291, 35292, 35733
	};

	CEPGP_tokens.Kara = {
		["Hand"] = {
			[29756]	= 120,
			[29757]	= 120,
			[29758] = 120
		},
		["Head"] = {
			[29759] = 120,
			[29760] = 120,
			[29761] = 120
		}
	};
	CEPGP_tokens.Gruul = {
		["Shoulder"] = {
			[29762] = 120,
			[29763] = 120,
			[29764] = 120
		},
		["Legs"] = {
			[29765] = 120,
			[29766] = 120,
			[29767] = 120
		}
	};
	CEPGP_tokens.Mag = {
		["Chest"] = {
			[29753] = 120,
			[29754] = 120,
			[29755] = 120
		},
		["Finger"] = {
			[32385] = 125,
			[32386] = 125
		}
	};
	CEPGP_tokens.SSC = {
		["Hand"] = {
			[30239] = 133,
			[30240] = 133,
			[30241] = 133
		},
		["Head"] = {
			[30242] = 133,
			[30243] = 133,
			[30244] = 133
		},
		["Legs"] = {
			[30245] = 133,
			[30246] = 133,
			[30247] = 133
		}
	};
	CEPGP_tokens.TheEye = {
		["Chest"] = {
			[30236] = 133,
			[30237] = 133,
			[30238] = 133
		},
		["Shoulder"] = {
			[30248] = 133,
			[30249] = 133,
			[30250] = 133
		}
	};
	CEPGP_tokens.Hyjal = {
		["Hand"] = {
			[31092] = 146,
			[31093] = 146,
			[31094] = 146
		},
		["Head"] = {
			[31095] = 146,
			[31096] = 146,
			[31097] = 146
		}
	};
	CEPGP_tokens.BT = {
		["Chest"] = {
			[31089] = 146,
			[31090] = 146,
			[31091] = 146
		},
		["Legs"] = {
			[31098] = 146,
			[31099] = 146,
			[31100] = 146
		},
		["Shoulder"] = {
			[31101] = 146,
			[31102] = 146,
			[31103] = 146
		}
	};
	--[[ Blood of Zul'jin in TBC only rewarded Badges of Justice and was of rare quality
	CEPGP_tokens.ZA = {
		["Chest"] = {
			[33102] = 1
		}
	};
	]]
	CEPGP_tokens.Sunwell = {
		["Wrist"] = {
			[34848] = 154,
			[34851] = 154,
			[34852] = 154
		},
		["Waist"] = {
			[34853] = 154,
			[34854] = 154,
			[34855] = 154
		},
		["Feet"] = {
			[34856] = 154,
			[34857] = 154,
			[34858] = 154
		}
	};

	local function CEPGP_EP_options_TabOnClick()
		if ( CEPGP_EP_options.selectedTab == 2 ) then
			CEPGP_EP_options_expTBC:Show();
			CEPGP_EP_options_expVanilla:Hide();
			CEPGP_toggleBossConfigFrame("CEPGP_EP_options_Karazhan");
		else
			CEPGP_EP_options_expTBC:Hide();
			CEPGP_EP_options_expVanilla:Show();
			CEPGP_toggleBossConfigFrame("CEPGP_EP_options_mc");
		end
	end

	local expTBC = CreateFrame("Frame", "CEPGP_EP_options_expTBC", CEPGP_EP_options, "TooltipBorderedFrameTemplate");
	expTBC:SetPoint("TOPLEFT", CEPGP_EP_options, "TOPLEFT", 22, -50);
	expTBC:SetPoint("BOTTOMRIGHT", CEPGP_EP_options, "BOTTOMRIGHT", -22, 22);
	expTBC:SetFrameLevel(1);
	expTBC:Hide();	

	local expVanilla = CreateFrame("Frame", "CEPGP_EP_options_expVanilla", CEPGP_EP_options, "TooltipBorderedFrameTemplate");
	expVanilla:SetPoint("TOPLEFT", CEPGP_EP_options, "TOPLEFT", 22, -50);
	expVanilla:SetPoint("BOTTOMRIGHT", CEPGP_EP_options, "BOTTOMRIGHT", -22, 22);
	expVanilla:Show();

	local tab1 = CreateFrame("Button", "CEPGP_EP_optionsTab1", CEPGP_EP_options, "OptionsFrameTabButtonTemplate");
	tab1:SetText("Vanilla");
	tab1:SetPoint("BOTTOMLEFT", expVanilla, "TOPLEFT", 6, -2);
	tab1:SetID(1);
	tab1:SetScript("OnClick", function()
		PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB);
        PanelTemplates_Tab_OnClick(tab1, CEPGP_EP_options);
        CEPGP_EP_options_TabOnClick();
	end)

	local tab2 = CreateFrame("Button", "CEPGP_EP_optionsTab2", CEPGP_EP_options, "OptionsFrameTabButtonTemplate");
	tab2:SetText("TBC");
	tab2:SetPoint("TOPLEFT", tab1, "TOPRIGHT", -16, 0);
	tab2:SetFrameLevel(10000);
	tab2:SetID(2);
	tab2:SetScript("OnClick", function()
		PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB);
        PanelTemplates_Tab_OnClick(tab2, CEPGP_EP_options);
        CEPGP_EP_options_TabOnClick();
	end)

	PanelTemplates_SetNumTabs(CEPGP_EP_options, 2);
	CEPGP_EP_options.selectedTab = 1;
	PanelTemplates_UpdateTabs(CEPGP_EP_options);

	-- Move Vanilla buttons into the expVanilla frame
	CEPGP_EP_options_mc_button:SetParent(expVanilla);
	CEPGP_EP_options_mc_button:ClearAllPoints();
	CEPGP_EP_options_mc_button:SetPoint("TOPLEFT", expTBC, "TOPLEFT", 10, -10);

	CEPGP_EP_options_bwl_button:SetParent(expVanilla);
	CEPGP_EP_options_bwl_button:ClearAllPoints();
	CEPGP_EP_options_bwl_button:SetPoint("TOP", expTBC, "TOP", 0, -10);

	CEPGP_EP_options_zg_button:SetParent(expVanilla);
	CEPGP_EP_options_zg_button:ClearAllPoints();
	CEPGP_EP_options_zg_button:SetPoint("TOPRIGHT", expTBC, "TOPRIGHT", -10, -10);
	CEPGP_EP_options_zg_button:SetWidth(150);

	CEPGP_EP_options_aq20_button:SetParent(expVanilla);
	CEPGP_EP_options_aq20_button:ClearAllPoints();
	CEPGP_EP_options_aq20_button:SetPoint("TOPLEFT", CEPGP_EP_options_mc_button, "BOTTOMLEFT", 0, -10);

	CEPGP_EP_options_aq40_button:SetParent(expVanilla);
	CEPGP_EP_options_aq40_button:ClearAllPoints();
	CEPGP_EP_options_aq40_button:SetPoint("TOP", CEPGP_EP_options_bwl_button, "BOTTOM", 0, -10);

	CEPGP_EP_options_naxx_button:SetParent(expVanilla);
	CEPGP_EP_options_naxx_button:ClearAllPoints();
	CEPGP_EP_options_naxx_button:SetPoint("TOPRIGHT", CEPGP_EP_options_zg_button, "BOTTOMRIGHT", 0, -10);
	CEPGP_EP_options_naxx_button:SetWidth(150);

	CEPGP_EP_options_world_button:SetParent(expVanilla);
	CEPGP_EP_options_world_button:ClearAllPoints();
	CEPGP_EP_options_world_button:SetPoint("TOP", CEPGP_EP_options_aq40_button, "BOTTOM", 0, -10);

	-- Move frames in GP options down so they dont eat mouse clicks for new buttons.
	CEPGP_EP_options_autoaward_header:SetPoint("TOPRIGHT", -35, -180);
	CEPGP_EP_options_mc:SetPoint("TOPLEFT", 20, -200);
	CEPGP_EP_options_worldboss:SetPoint("TOPLEFT", 20, -200);
	CEPGP_EP_options_aq40:SetPoint("TOPLEFT", 20, -200);
	CEPGP_EP_options_bwl:SetPoint("TOPLEFT", 20, -200);
	CEPGP_EP_options_zg:SetPoint("TOPLEFT", 20, -200);
	CEPGP_EP_options_naxx:SetPoint("TOPLEFT", 20, -200);
	CEPGP_EP_options_aq20:SetPoint("TOPLEFT", 20, -200);

	CEPGP_EP_options_autoaward_header:ClearAllPoints();
	CEPGP_EP_options_autoaward_header:SetPoint("TOPRIGHT", CEPGP_EP_options, "TOPRIGHT", -35, -160);

	-- Create new raid buttons and boss EP edit boxes for GP options frame.
	for RaidIndex, v in ipairs(TBC_Bosses) do

		local RaidOptionFrame = CreateFrame("Frame", "CEPGP_EP_options_"..v[2], CEPGP_EP_options);
		RaidOptionFrame:Hide();
		RaidOptionFrame:SetWidth(300);
		RaidOptionFrame:SetHeight(300);
		RaidOptionFrame:SetPoint("TOPLEFT", 20, -200);

		local EP_Options_Button = CreateFrame("Button", "CEPGP_EP_options_"..v[2].."_button", expTBC, "GameMenuButtonTemplate");
		EP_Options_Button:SetWidth(150);
		EP_Options_Button:SetHeight(21);
		EP_Options_Button:SetText(v[1]);
		if RaidIndex == 1 then
			EP_Options_Button:SetPoint("TOPLEFT", 10, -10);
		elseif RaidIndex == 2 then
			EP_Options_Button:SetPoint("TOP", 0, -10);
		elseif RaidIndex == 3 then
			EP_Options_Button:SetPoint("TOPRIGHT", -10, -10);
		else
			EP_Options_Button:SetPoint("TOP", _G["CEPGP_EP_options_"..TBC_Bosses[RaidIndex-3][2].."_button"] , "BOTTOM", 0, -10);
		end

		EP_Options_Button:SetScript("OnClick", function()
													PlaySound(799);								
													CEPGP_toggleBossConfigFrame("CEPGP_EP_options_"..v[2]);
												end	);

		for i, j in ipairs(v[3]) do
			local CheckFrame = CreateFrame("CheckButton", "CEPGP_options_"..j[1].."_auto_check", _G["CEPGP_EP_options_"..v[2]], "AutoAwardEPCheckBox");
			if i == 1 then
				CheckFrame:SetPoint("TOP", CEPGP_EP_options_autoaward_header, "BOTTOM", 0, -10);
			else
				CheckFrame:SetPoint("TOP", _G["CEPGP_options_"..v[3][i-1][1].."_auto_check"], "BOTTOM", 0, 3);
			end
			local ValueFrame = CreateFrame("EditBox", "CEPGP_options_"..j[1].."_EP_value", _G["CEPGP_EP_options_"..v[2]], "epValInputBoxTemplate");
			if i == 1 then
				ValueFrame:SetPoint("TOP", "CEPGP_EP_options_EP_header", "BOTTOM", 0, -15);
			else
				ValueFrame:SetPoint("TOP", _G["CEPGP_options_"..v[3][i-1][1].."_EP_value"], "BOTTOM", 0, -12.5);
			end
			local ValFrame = _G["CEPGP_EP_options_"..v[2]]:CreateFontString("CEPGP_options_"..j[1].."_val", "OVERLAY", "GameFontHighlight");
			ValFrame:SetText(j[1]);
			if i == 1 then
				ValFrame:SetPoint("LEFT", _G["CEPGP_options_"..j[1].."_EP_value"], "LEFT", -400, 0);
			else
				ValFrame:SetPoint("TOPLEFT", _G["CEPGP_options_"..v[3][i-1][1].."_val"], "BOTTOMLEFT", 0, -10);
			end
		end
		CEPGP_Info.BossEPFrames[RaidIndex+7] = _G["CEPGP_EP_options_"..v[2]];
	end

	-- Add new raids to the Raid Modifiers window.
	local rmScroll = CreateFrame("ScrollFrame", "CEPGP_raid_modifiers_scrollframe", CEPGP_raid_modifiers, "UIPanelScrollFrameTemplate");
	rmScroll:SetPoint("TOPLEFT", CEPGP_raid_modifiers_description, "BOTTOMLEFT");
	rmScroll:SetSize(200,170);
	rmScroll:SetPoint("TOPLEFT", CEPGP_raid_modifiers, "TOPLEFT", 15, -95);
	
	local rmScrollChild = CreateFrame("Frame", "CEPGP_raid_modifiers_scrollchild", rmScroll);
	rmScrollChild:SetSize(170,370);
	rmScrollChild:SetPoint("TOP", rmScroll, "TOP");
	rmScroll:SetScrollChild(rmScrollChild);

	-- Move existing Raid Modifer frames into the new scroll frame.
	
	_G["CEPGP_raid_modifiers_Molten Core_value"]:SetParent(_G["CEPGP_raid_modifiers"]);
	_G["CEPGP_raid_modifiers_Molten Core_value"]:ClearAllPoints();
	_G["CEPGP_raid_modifiers_Molten Core_value"]:SetPoint("TOPLEFT", "CEPGP_raid_modifiers", "TOPLEFT", 15, -80);

	_G["CEPGP_raid_modifiers_Molten Core"]:SetParent(rmScrollChild);
	_G["CEPGP_raid_modifiers_Molten Core"]:ClearAllPoints();
	_G["CEPGP_raid_modifiers_Molten Core"]:SetPoint("TOPLEFT");
	_G["CEPGP_raid_modifiers_Molten Core_string"]:SetParent(_G["CEPGP_raid_modifiers_Molten Core"]);
	_G["CEPGP_raid_modifiers_Onyxia's Lair"]:SetParent(rmScrollChild);
	_G["CEPGP_raid_modifiers_Onyxia's Lair"]:ClearAllPoints()
	_G["CEPGP_raid_modifiers_Onyxia's Lair"]:SetPoint("TOPLEFT", _G["CEPGP_raid_modifiers_Molten Core"], "BOTTOMLEFT", 0, -10);
	_G["CEPGP_raid_modifiers_Onyxia's Lair_string"]:SetParent(_G["CEPGP_raid_modifiers_Onyxia's Lair"]);
	_G["CEPGP_raid_modifiers_Blackwing Lair"]:SetParent(rmScrollChild);
	_G["CEPGP_raid_modifiers_Blackwing Lair"]:ClearAllPoints()
	_G["CEPGP_raid_modifiers_Blackwing Lair"]:SetPoint("TOPLEFT", _G["CEPGP_raid_modifiers_Onyxia's Lair"], "BOTTOMLEFT", 0, -10);
	_G["CEPGP_raid_modifiers_Blackwing Lair_string"]:SetParent(_G["CEPGP_raid_modifiers_Blackwing Lair"]);
	_G["CEPGP_raid_modifiers_Zul'Gurub"]:SetParent(rmScrollChild);
	_G["CEPGP_raid_modifiers_Zul'Gurub"]:ClearAllPoints()
	_G["CEPGP_raid_modifiers_Zul'Gurub"]:SetPoint("TOPLEFT", _G["CEPGP_raid_modifiers_Blackwing Lair"], "BOTTOMLEFT", 0, -10);
	_G["CEPGP_raid_modifiers_Zul'Gurub_string"]:SetParent(_G["CEPGP_raid_modifiers_Zul'Gurub"]);
	_G["CEPGP_raid_modifiers_The Ruins of Ahn'Qiraj"]:SetParent(rmScrollChild);
	_G["CEPGP_raid_modifiers_The Ruins of Ahn'Qiraj"]:ClearAllPoints()
	_G["CEPGP_raid_modifiers_The Ruins of Ahn'Qiraj"]:SetPoint("TOPLEFT", _G["CEPGP_raid_modifiers_Zul'Gurub"], "BOTTOMLEFT", 0, -10);
	_G["CEPGP_raid_modifiers_The Ruins of Ahn'Qiraj_string"]:SetParent(_G["CEPGP_raid_modifiers_The Ruins of Ahn'Qiraj"]);
	_G["CEPGP_raid_modifiers_The Temple of Ahn'Qiraj"]:SetParent(rmScrollChild);
	_G["CEPGP_raid_modifiers_The Temple of Ahn'Qiraj"]:ClearAllPoints()
	_G["CEPGP_raid_modifiers_The Temple of Ahn'Qiraj"]:SetPoint("TOPLEFT", _G["CEPGP_raid_modifiers_The Ruins of Ahn'Qiraj"], "BOTTOMLEFT", 0, -10);
	_G["CEPGP_raid_modifiers_The Temple of Ahn'Qiraj_string"]:SetParent(_G["CEPGP_raid_modifiers_The Temple of Ahn'Qiraj"]);
	_G["CEPGP_raid_modifiers_Naxxramas"]:SetParent(rmScrollChild);
	_G["CEPGP_raid_modifiers_Naxxramas"]:ClearAllPoints()
	_G["CEPGP_raid_modifiers_Naxxramas"]:SetPoint("TOPLEFT", _G["CEPGP_raid_modifiers_The Temple of Ahn'Qiraj"], "BOTTOMLEFT", 0, -10);
	_G["CEPGP_raid_modifiers_Naxxramas_string"]:SetParent(_G["CEPGP_raid_modifiers_Naxxramas"]);

	local PreviousRaid = "CEPGP_raid_modifiers_Naxxramas";
	for RaidIndex, v in ipairs(TBC_Bosses) do

		local rmRaid = CreateFrame("EditBox", "CEPGP_raid_modifiers_"..v[2], rmScrollChild, "InputBoxTemplate");
		rmRaid:SetSize(50,15);
		rmRaid:SetPoint("TOPLEFT", _G[PreviousRaid], "BOTTOMLEFT", 0, -10);
		rmRaid:SetAttribute("raid", v[1]);
		local rmRaidText = rmRaid:CreateFontString("CEPGP_raid_modifiers_"..v[2].."_string", "OVERLAY", "GameFontNormalSmall");
		rmRaidText:SetPoint("LEFT", rmRaid, "RIGHT", 10, 0);
		rmRaidText:SetText(v[1]);
		rmRaid:SetScript("OnLoad", function() rmRaid:SetAutoFocus(false) end);
		rmRaid:SetScript("OnShow", function() 
			local raid = rmRaid:GetAttribute("raid");
			local amount = CEPGP.GP.RaidModifiers[raid];
			_G[rmRaid:GetName() .. "_string"]:SetText(raid);
			rmRaid:SetText(CEPGP.GP.RaidModifiers[raid]);
		end);
		rmRaid:SetScript("OnEnterPressed", function() rmRaid:ClearFocus(); rmRaid:HighlightText(0,0); end);
		rmRaid:SetScript("OnEscapePressed", function() rmRaid:ClearFocus(); rmRaid:HighlightText(0,0); end);
		rmRaid:SetScript("OnTabPressed", function() 
			rmRaid:ClearFocus();
			rmRaid:HighlightText(0,0);
			
			if IsShiftKeyDown() then
				_G[PreviousRaid]:SetFocus(true);
			else
				if RaidIndex ~= #TBC_Bosses then
					_G["CEPGP_raid_modifiers_"..TBC_Bosses[RaidIndex+1][2]]:SetFocus(true);
				end
			end
		end);
		rmRaid:SetScript("OnEditFocusLost", function()
			local raid = rmRaid:GetAttribute("raid");
			local value = rmRaid:GetText();
			local default = CEPGP.GP.RaidModifiers[raid];
			
			if string.find(value, '[^-0-9.]') then
				rmRaid:SetText(default);
				return;
			end
			
			if value == default then
				return;
			end
			
			CEPGP.GP.RaidModifiers[raid] = tonumber(value);	
		end);

		PreviousRaid = rmRaid:GetName();

	end

	CEPGP_addPlugin("CEPGP-TBC", nil, true, nil);
	
end