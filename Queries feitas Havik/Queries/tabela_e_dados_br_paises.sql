/* Cria a tabela de pa�ses e a alimenta com informa��o */

CREATE TABLE br_paises (
	iso CHAR(2) NOT NULL PRIMARY KEY,
	iso3 char(3) NOT NULL,
	id SMALLINT,
	nome VARCHAR(255) NOT NULL
);

INSERT INTO br_paises VALUES ('', '', '001', '');
INSERT INTO br_paises VALUES ('AF', 'AFG', '004', 'Afeganist�o');
INSERT INTO br_paises VALUES ('ZA', 'ZAF', '710', '�frica do Sul');
INSERT INTO br_paises VALUES ('AX', 'ALA', '248', '�land, Ilhas');
INSERT INTO br_paises VALUES ('AL', 'ALB', '008', 'Alb�nia');
INSERT INTO br_paises VALUES ('DE', 'DEU', '276', 'Alemanha');
INSERT INTO br_paises VALUES ('AD', 'AND', '020', 'Andorra');
INSERT INTO br_paises VALUES ('AO', 'AGO', '024', 'Angola');
INSERT INTO br_paises VALUES ('AI', 'AIA', '660', 'Anguilla');
INSERT INTO br_paises VALUES ('AQ', 'ATA', '010', 'Ant�rctida');
INSERT INTO br_paises VALUES ('AG', 'ATG', '028', 'Antigua e Barbuda');
INSERT INTO br_paises VALUES ('AN', 'ANT', '530', 'Antilhas Holandesas');
INSERT INTO br_paises VALUES ('SA', 'SAU', '682', 'Ar�bia Saudita');
INSERT INTO br_paises VALUES ('DZ', 'DZA', '012', 'Arg�lia');
INSERT INTO br_paises VALUES ('AR', 'ARG', '032', 'Argentina');
INSERT INTO br_paises VALUES ('AM', 'ARM', '051', 'Arm�nia');
INSERT INTO br_paises VALUES ('AW', 'ABW', '533', 'Aruba');
INSERT INTO br_paises VALUES ('AU', 'AUS', '036', 'Austr�lia');
INSERT INTO br_paises VALUES ('AT', 'AUT', '040', '�ustria');
INSERT INTO br_paises VALUES ('AZ', 'AZE', '031', 'Azerbeij�o');
INSERT INTO br_paises VALUES ('BS', 'BHS', '044', 'Bahamas');
INSERT INTO br_paises VALUES ('BH', 'BHR', '048', 'Bahrain');
INSERT INTO br_paises VALUES ('BD', 'BGD', '050', 'Bangladesh');
INSERT INTO br_paises VALUES ('BB', 'BRB', '052', 'Barbados');
INSERT INTO br_paises VALUES ('BE', 'BEL', '056', 'B�lgica');
INSERT INTO br_paises VALUES ('BZ', 'BLZ', '084', 'Belize');
INSERT INTO br_paises VALUES ('BJ', 'BEN', '204', 'Benin');
INSERT INTO br_paises VALUES ('BM', 'BMU', '060', 'Bermuda');
INSERT INTO br_paises VALUES ('BY', 'BLR', '112', 'Bielo-R�ssia');
INSERT INTO br_paises VALUES ('BO', 'BOL', '068', 'Bol�via');
INSERT INTO br_paises VALUES ('BA', 'BIH', '070', 'B�snia-Herzegovina');
INSERT INTO br_paises VALUES ('BW', 'BWA', '072', 'Botswana');
INSERT INTO br_paises VALUES ('BV', 'BVT', '074', 'Bouvet, Ilha');
INSERT INTO br_paises VALUES ('BR', 'BRA', '076', 'Brasil');
INSERT INTO br_paises VALUES ('BN', 'BRN', '096', 'Brunei');
INSERT INTO br_paises VALUES ('BG', 'BGR', '100', 'Bulg�ria');
INSERT INTO br_paises VALUES ('BF', 'BFA', '854', 'Burkina Faso');
INSERT INTO br_paises VALUES ('BI', 'BDI', '108', 'Burundi');
INSERT INTO br_paises VALUES ('BT', 'BTN', '064', 'But�o');
INSERT INTO br_paises VALUES ('CV', 'CPV', '132', 'Cabo Verde');
INSERT INTO br_paises VALUES ('KH', 'KHM', '116', 'Cambodja');
INSERT INTO br_paises VALUES ('CM', 'CMR', '120', 'Camar�es');
INSERT INTO br_paises VALUES ('CA', 'CAN', '124', 'Canad�');
INSERT INTO br_paises VALUES ('KY', 'CYM', '136', 'Cayman, Ilhas');
INSERT INTO br_paises VALUES ('KZ', 'KAZ', '398', 'Cazaquist�o');
INSERT INTO br_paises VALUES ('CF', 'CAF', '140', 'Centro-africana, Rep�blica');
INSERT INTO br_paises VALUES ('TD', 'TCD', '148', 'Chade');
INSERT INTO br_paises VALUES ('CZ', 'CZE', '203', 'Checa, Rep�blica');
INSERT INTO br_paises VALUES ('CL', 'CHL', '152', 'Chile');
INSERT INTO br_paises VALUES ('CN', 'CHN', '156', 'China');
INSERT INTO br_paises VALUES ('CY', 'CYP', '196', 'Chipre');
INSERT INTO br_paises VALUES ('CX', 'CXR', '162', 'Christmas, Ilha');
INSERT INTO br_paises VALUES ('CC', 'CCK', '166', 'Cocos, Ilhas');
INSERT INTO br_paises VALUES ('CO', 'COL', '170', 'Col�mbia');
INSERT INTO br_paises VALUES ('KM', 'COM', '174', 'Comores');
INSERT INTO br_paises VALUES ('CG', 'COG', '178', 'Congo, Rep�blica do');
INSERT INTO br_paises VALUES ('CD', 'COD', '180', 'Congo, Rep�blica Democr�tica do (antigo Zaire)');
INSERT INTO br_paises VALUES ('CK', 'COK', '184', 'Cook, Ilhas');
INSERT INTO br_paises VALUES ('KR', 'KOR', '410', 'Coreia do Sul');
INSERT INTO br_paises VALUES ('KP', 'PRK', '408', 'Coreia, Rep�blica Democr�tica da (Coreia do Norte)');
INSERT INTO br_paises VALUES ('CI', 'CIV', '384', 'Costa do Marfim');
INSERT INTO br_paises VALUES ('CR', 'CRI', '188', 'Costa Rica');
INSERT INTO br_paises VALUES ('HR', 'HRV', '191', 'Cro�cia');
INSERT INTO br_paises VALUES ('CU', 'CUB', '192', 'Cuba');
INSERT INTO br_paises VALUES ('DK', 'DNK', '208', 'Dinamarca');
INSERT INTO br_paises VALUES ('DJ', 'DJI', '262', 'Djibouti');
INSERT INTO br_paises VALUES ('DM', 'DMA', '212', 'Dominica');
INSERT INTO br_paises VALUES ('DO', 'DOM', '214', 'Dominicana, Rep�blica');
INSERT INTO br_paises VALUES ('EG', 'EGY', '818', 'Egipto');
INSERT INTO br_paises VALUES ('SV', 'SLV', '222', 'El Salvador');
INSERT INTO br_paises VALUES ('AE', 'ARE', '784', 'Emiratos �rabes Unidos');
INSERT INTO br_paises VALUES ('EC', 'ECU', '218', 'Equador');
INSERT INTO br_paises VALUES ('ER', 'ERI', '232', 'Eritreia');
INSERT INTO br_paises VALUES ('SK', 'SVK', '703', 'Eslov�quia');
INSERT INTO br_paises VALUES ('SI', 'SVN', '705', 'Eslov�nia');
INSERT INTO br_paises VALUES ('ES', 'ESP', '724', 'Espanha');
INSERT INTO br_paises VALUES ('US', 'USA', '840', 'Estados Unidos da Am�rica');
INSERT INTO br_paises VALUES ('EE', 'EST', '233', 'Est�nia');
INSERT INTO br_paises VALUES ('ET', 'ETH', '231', 'Eti�pia');
INSERT INTO br_paises VALUES ('FO', 'FRO', '234', 'Faroe, Ilhas');
INSERT INTO br_paises VALUES ('FJ', 'FJI', '242', 'Fiji');
INSERT INTO br_paises VALUES ('PH', 'PHL', '608', 'Filipinas');
INSERT INTO br_paises VALUES ('FI', 'FIN', '246', 'Finl�ndia');
INSERT INTO br_paises VALUES ('FR', 'FRA', '250', 'Fran�a');
INSERT INTO br_paises VALUES ('GA', 'GAB', '266', 'Gab�o');
INSERT INTO br_paises VALUES ('GM', 'GMB', '270', 'G�mbia');
INSERT INTO br_paises VALUES ('GH', 'GHA', '288', 'Gana');
INSERT INTO br_paises VALUES ('GE', 'GEO', '268', 'Ge�rgia');
INSERT INTO br_paises VALUES ('GS', 'SGS', '239', 'Ge�rgia do Sul e Sandwich do Sul, Ilhas');
INSERT INTO br_paises VALUES ('GI', 'GIB', '292', 'Gibraltar');
INSERT INTO br_paises VALUES ('GR', 'GRC', '300', 'Gr�cia');
INSERT INTO br_paises VALUES ('GD', 'GRD', '308', 'Grenada');
INSERT INTO br_paises VALUES ('GL', 'GRL', '304', 'Gronel�ndia');
INSERT INTO br_paises VALUES ('GP', 'GLP', '312', 'Guadeloupe');
INSERT INTO br_paises VALUES ('GU', 'GUM', '316', 'Guam');
INSERT INTO br_paises VALUES ('GT', 'GTM', '320', 'Guatemala');
INSERT INTO br_paises VALUES ('GG', 'GGY', '831', 'Guernsey');
INSERT INTO br_paises VALUES ('GY', 'GUY', '328', 'Guiana');
INSERT INTO br_paises VALUES ('GF', 'GUF', '254', 'Guiana Francesa');
INSERT INTO br_paises VALUES ('GW', 'GNB', '624', 'Guin�-Bissau');
INSERT INTO br_paises VALUES ('GN', 'GIN', '324', 'Guin�-Conacri');
INSERT INTO br_paises VALUES ('GQ', 'GNQ', '226', 'Guin� Equatorial');
INSERT INTO br_paises VALUES ('HT', 'HTI', '332', 'Haiti');
INSERT INTO br_paises VALUES ('HM', 'HMD', '334', 'Heard e Ilhas McDonald, Ilha');
INSERT INTO br_paises VALUES ('HN', 'HND', '340', 'Honduras');
INSERT INTO br_paises VALUES ('HK', 'HKG', '344', 'Hong Kong');
INSERT INTO br_paises VALUES ('HU', 'HUN', '348', 'Hungria');
INSERT INTO br_paises VALUES ('YE', 'YEM', '887', 'I�men');
INSERT INTO br_paises VALUES ('IN', 'IND', '356', '�ndia');
INSERT INTO br_paises VALUES ('ID', 'IDN', '360', 'Indon�sia');
INSERT INTO br_paises VALUES ('IQ', 'IRQ', '368', 'Iraque');
INSERT INTO br_paises VALUES ('IR', 'IRN', '364', 'Ir�o');
INSERT INTO br_paises VALUES ('IE', 'IRL', '372', 'Irlanda');
INSERT INTO br_paises VALUES ('IS', 'ISL', '352', 'Isl�ndia');
INSERT INTO br_paises VALUES ('IL', 'ISR', '376', 'Israel');
INSERT INTO br_paises VALUES ('IT', 'ITA', '380', 'It�lia');
INSERT INTO br_paises VALUES ('JM', 'JAM', '388', 'Jamaica');
INSERT INTO br_paises VALUES ('JP', 'JPN', '392', 'Jap�o');
INSERT INTO br_paises VALUES ('JE', 'JEY', '832', 'Jersey');
INSERT INTO br_paises VALUES ('JO', 'JOR', '400', 'Jord�nia');
INSERT INTO br_paises VALUES ('KI', 'KIR', '296', 'Kiribati');
INSERT INTO br_paises VALUES ('KW', 'KWT', '414', 'Kuwait');
INSERT INTO br_paises VALUES ('LA', 'LAO', '418', 'Laos');
INSERT INTO br_paises VALUES ('LS', 'LSO', '426', 'Lesoto');
INSERT INTO br_paises VALUES ('LV', 'LVA', '428', 'Let�nia');
INSERT INTO br_paises VALUES ('LB', 'LBN', '422', 'L�bano');
INSERT INTO br_paises VALUES ('LR', 'LBR', '430', 'Lib�ria');
INSERT INTO br_paises VALUES ('LY', 'LBY', '434', 'L�bia');
INSERT INTO br_paises VALUES ('LI', 'LIE', '438', 'Liechtenstein');
INSERT INTO br_paises VALUES ('LT', 'LTU', '440', 'Litu�nia');
INSERT INTO br_paises VALUES ('LU', 'LUX', '442', 'Luxemburgo');
INSERT INTO br_paises VALUES ('MO', 'MAC', '446', 'Macau');
INSERT INTO br_paises VALUES ('MK', 'MKD', '807', 'Maced�nia, Rep�blica da');
INSERT INTO br_paises VALUES ('MG', 'MDG', '450', 'Madag�scar');
INSERT INTO br_paises VALUES ('MY', 'MYS', '458', 'Mal�sia');
INSERT INTO br_paises VALUES ('MW', 'MWI', '454', 'Malawi');
INSERT INTO br_paises VALUES ('MV', 'MDV', '462', 'Maldivas');
INSERT INTO br_paises VALUES ('ML', 'MLI', '466', 'Mali');
INSERT INTO br_paises VALUES ('MT', 'MLT', '470', 'Malta');
INSERT INTO br_paises VALUES ('FK', 'FLK', '238', 'Malvinas, Ilhas (Falkland)');
INSERT INTO br_paises VALUES ('IM', 'IMN', '833', 'Man, Ilha de');
INSERT INTO br_paises VALUES ('MP', 'MNP', '580', 'Marianas Setentrionais');
INSERT INTO br_paises VALUES ('MA', 'MAR', '504', 'Marrocos');
INSERT INTO br_paises VALUES ('MH', 'MHL', '584', 'Marshall, Ilhas');
INSERT INTO br_paises VALUES ('MQ', 'MTQ', '474', 'Martinica');
INSERT INTO br_paises VALUES ('MU', 'MUS', '480', 'Maur�cia');
INSERT INTO br_paises VALUES ('MR', 'MRT', '478', 'Maurit�nia');
INSERT INTO br_paises VALUES ('YT', 'MYT', '175', 'Mayotte');
INSERT INTO br_paises VALUES ('UM', 'UMI', '581', 'Menores Distantes dos Estados Unidos, Ilhas');
INSERT INTO br_paises VALUES ('MX', 'MEX', '484', 'M�xico');
INSERT INTO br_paises VALUES ('MM', 'MMR', '104', 'Myanmar (antiga Birm�nia)');
INSERT INTO br_paises VALUES ('FM', 'FSM', '583', 'Micron�sia, Estados Federados da');
INSERT INTO br_paises VALUES ('MZ', 'MOZ', '508', 'Mo�ambique');
INSERT INTO br_paises VALUES ('MD', 'MDA', '498', 'Mold�via');
INSERT INTO br_paises VALUES ('MC', 'MCO', '492', 'M�naco');
INSERT INTO br_paises VALUES ('MN', 'MNG', '496', 'Mong�lia');
INSERT INTO br_paises VALUES ('ME', 'MNE', '499', 'Montenegro');
INSERT INTO br_paises VALUES ('MS', 'MSR', '500', 'Montserrat');
INSERT INTO br_paises VALUES ('NA', 'NAM', '516', 'Nam�bia');
INSERT INTO br_paises VALUES ('NR', 'NRU', '520', 'Nauru');
INSERT INTO br_paises VALUES ('NP', 'NPL', '524', 'Nepal');
INSERT INTO br_paises VALUES ('NI', 'NIC', '558', 'Nicar�gua');
INSERT INTO br_paises VALUES ('NE', 'NER', '562', 'N�ger');
INSERT INTO br_paises VALUES ('NG', 'NGA', '566', 'Nig�ria');
INSERT INTO br_paises VALUES ('NU', 'NIU', '570', 'Niue');
INSERT INTO br_paises VALUES ('NF', 'NFK', '574', 'Norfolk, Ilha');
INSERT INTO br_paises VALUES ('NO', 'NOR', '578', 'Noruega');
INSERT INTO br_paises VALUES ('NC', 'NCL', '540', 'Nova Caled�nia');
INSERT INTO br_paises VALUES ('NZ', 'NZL', '554', 'Nova Zel�ndia (Aotearoa)');
INSERT INTO br_paises VALUES ('OM', 'OMN', '512', 'Oman');
INSERT INTO br_paises VALUES ('NL', 'NLD', '528', 'Pa�ses Baixos (Holanda)');
INSERT INTO br_paises VALUES ('PW', 'PLW', '585', 'Palau');
INSERT INTO br_paises VALUES ('PS', 'PSE', '275', 'Palestina');
INSERT INTO br_paises VALUES ('PA', 'PAN', '591', 'Panam�');
INSERT INTO br_paises VALUES ('PG', 'PNG', '598', 'Papua-Nova Guin�');
INSERT INTO br_paises VALUES ('PK', 'PAK', '586', 'Paquist�o');
INSERT INTO br_paises VALUES ('PY', 'PRY', '600', 'Paraguai');
INSERT INTO br_paises VALUES ('PE', 'PER', '604', 'Peru');
INSERT INTO br_paises VALUES ('PN', 'PCN', '612', 'Pitcairn');
INSERT INTO br_paises VALUES ('PF', 'PYF', '258', 'Polin�sia Francesa');
INSERT INTO br_paises VALUES ('PL', 'POL', '616', 'Pol�nia');
INSERT INTO br_paises VALUES ('PR', 'PRI', '630', 'Porto Rico');
INSERT INTO br_paises VALUES ('PT', 'PRT', '620', 'Portugal');
INSERT INTO br_paises VALUES ('QA', 'QAT', '634', 'Qatar');
INSERT INTO br_paises VALUES ('KE', 'KEN', '404', 'Qu�nia');
INSERT INTO br_paises VALUES ('KG', 'KGZ', '417', 'Quirguist�o');
INSERT INTO br_paises VALUES ('GB', 'GBR', '826', 'Reino Unido da Gr�-Bretanha e Irlanda do Norte');
INSERT INTO br_paises VALUES ('RE', 'REU', '638', 'Reuni�o');
INSERT INTO br_paises VALUES ('RO', 'ROU', '642', 'Rom�nia');
INSERT INTO br_paises VALUES ('RW', 'RWA', '646', 'Ruanda');
INSERT INTO br_paises VALUES ('RU', 'RUS', '643', 'R�ssia');
INSERT INTO br_paises VALUES ('EH', 'ESH', '732', 'Saara Ocidental');
INSERT INTO br_paises VALUES ('AS', 'ASM', '016', 'Samoa Americana');
INSERT INTO br_paises VALUES ('WS', 'WSM', '882', 'Samoa (Samoa Ocidental)');
INSERT INTO br_paises VALUES ('PM', 'SPM', '666', 'Saint Pierre et Miquelon');
INSERT INTO br_paises VALUES ('SB', 'SLB', '090', 'Salom�o, Ilhas');
INSERT INTO br_paises VALUES ('KN', 'KNA', '659', 'S�o Crist�v�o e N�vis (Saint Kitts e Nevis)');
INSERT INTO br_paises VALUES ('SM', 'SMR', '674', 'San Marino');
INSERT INTO br_paises VALUES ('ST', 'STP', '678', 'S�o Tom� e Pr�ncipe');
INSERT INTO br_paises VALUES ('VC', 'VCT', '670', 'S�o Vicente e Granadinas');
INSERT INTO br_paises VALUES ('SH', 'SHN', '654', 'Santa Helena');
INSERT INTO br_paises VALUES ('LC', 'LCA', '662', 'Santa L�cia');
INSERT INTO br_paises VALUES ('SN', 'SEN', '686', 'Senegal');
INSERT INTO br_paises VALUES ('SL', 'SLE', '694', 'Serra Leoa');
INSERT INTO br_paises VALUES ('RS', 'SRB', '688', 'S�rvia');
INSERT INTO br_paises VALUES ('SC', 'SYC', '690', 'Seychelles');
INSERT INTO br_paises VALUES ('SG', 'SGP', '702', 'Singapura');
INSERT INTO br_paises VALUES ('SY', 'SYR', '760', 'S�ria');
INSERT INTO br_paises VALUES ('SO', 'SOM', '706', 'Som�lia');
INSERT INTO br_paises VALUES ('LK', 'LKA', '144', 'Sri Lanka');
INSERT INTO br_paises VALUES ('SZ', 'SWZ', '748', 'Suazil�ndia');
INSERT INTO br_paises VALUES ('SD', 'SDN', '736', 'Sud�o');
INSERT INTO br_paises VALUES ('SE', 'SWE', '752', 'Su�cia');
INSERT INTO br_paises VALUES ('CH', 'CHE', '756', 'Su��a');
INSERT INTO br_paises VALUES ('SR', 'SUR', '740', 'Suriname');
INSERT INTO br_paises VALUES ('SJ', 'SJM', '744', 'Svalbard e Jan Mayen');
INSERT INTO br_paises VALUES ('TH', 'THA', '764', 'Tail�ndia');
INSERT INTO br_paises VALUES ('TW', 'TWN', '158', 'Taiwan');
INSERT INTO br_paises VALUES ('TJ', 'TJK', '762', 'Tajiquist�o');
INSERT INTO br_paises VALUES ('TZ', 'TZA', '834', 'Tanz�nia');
INSERT INTO br_paises VALUES ('TF', 'ATF', '260', 'Terras Austrais e Ant�rticas Francesas (TAAF)');
INSERT INTO br_paises VALUES ('IO', 'IOT', '086', 'Territ�rio Brit�nico do Oceano �ndico');
INSERT INTO br_paises VALUES ('TL', 'TLS', '626', 'Timor-Leste');
INSERT INTO br_paises VALUES ('TG', 'TGO', '768', 'Togo');
INSERT INTO br_paises VALUES ('TK', 'TKL', '772', 'Toquelau');
INSERT INTO br_paises VALUES ('TO', 'TON', '776', 'Tonga');
INSERT INTO br_paises VALUES ('TT', 'TTO', '780', 'Trindade e Tobago');
INSERT INTO br_paises VALUES ('TN', 'TUN', '788', 'Tun�sia');
INSERT INTO br_paises VALUES ('TC', 'TCA', '796', 'Turks e Caicos');
INSERT INTO br_paises VALUES ('TM', 'TKM', '795', 'Turquemenist�o');
INSERT INTO br_paises VALUES ('TR', 'TUR', '792', 'Turquia');
INSERT INTO br_paises VALUES ('TV', 'TUV', '798', 'Tuvalu');
INSERT INTO br_paises VALUES ('UA', 'UKR', '804', 'Ucr�nia');
INSERT INTO br_paises VALUES ('UG', 'UGA', '800', 'Uganda');
INSERT INTO br_paises VALUES ('UY', 'URY', '858', 'Uruguai');
INSERT INTO br_paises VALUES ('UZ', 'UZB', '860', 'Usbequist�o');
INSERT INTO br_paises VALUES ('VU', 'VUT', '548', 'Vanuatu');
INSERT INTO br_paises VALUES ('VA', 'VAT', '336', 'Vaticano');
INSERT INTO br_paises VALUES ('VE', 'VEN', '862', 'Venezuela');
INSERT INTO br_paises VALUES ('VN', 'VNM', '704', 'Vietname');
INSERT INTO br_paises VALUES ('VI', 'VIR', '850', 'Virgens Americanas, Ilhas');
INSERT INTO br_paises VALUES ('VG', 'VGB', '092', 'Virgens Brit�nicas, Ilhas');
INSERT INTO br_paises VALUES ('WF', 'WLF', '876', 'Wallis e Futuna');
INSERT INTO br_paises VALUES ('ZM', 'ZMB', '894', 'Z�mbia');
INSERT INTO br_paises VALUES ('ZW', 'ZWE', '716', 'Zimbabwe');
