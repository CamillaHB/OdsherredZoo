-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema eksamen
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `eksamen` DEFAULT CHARACTER SET utf8 ;
USE `eksamen` ;

-- -----------------------------------------------------
-- Table `eksamen`.`kategori`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eksamen`.`kategori` (
  `id_kategori` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `kategori` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `billede` VARCHAR(100) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id_kategori`)  COMMENT '',
  UNIQUE INDEX `id_kategori_UNIQUE` (`id_kategori` ASC)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eksamen`.`dyr`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eksamen`.`dyr` (
  `id_dyr` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `navn` VARCHAR(75) NULL DEFAULT NULL COMMENT '',
  `art` VARCHAR(75) NULL DEFAULT NULL COMMENT '',
  `information` VARCHAR(1000) NULL DEFAULT NULL COMMENT '',
  `fkey_id_kategori` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`id_dyr`, `fkey_id_kategori`)  COMMENT '',
  UNIQUE INDEX `art_UNIQUE` (`art` ASC)  COMMENT '',
  INDEX `fk_dyr_kategori1_idx` (`fkey_id_kategori` ASC)  COMMENT '',
  CONSTRAINT `fk_dyr_kategori1`
    FOREIGN KEY (`fkey_id_kategori`)
    REFERENCES `eksamen`.`kategori` (`id_kategori`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eksamen`.`billeder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eksamen`.`billeder` (
  `id_billeder` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `billede` VARCHAR(100) NULL DEFAULT NULL COMMENT '',
  `fkey_id_dyr` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`id_billeder`, `fkey_id_dyr`)  COMMENT '',
  INDEX `fk_billeder_dyr1_idx` (`fkey_id_dyr` ASC)  COMMENT '',
  CONSTRAINT `fk_billeder_dyr1`
    FOREIGN KEY (`fkey_id_dyr`)
    REFERENCES `eksamen`.`dyr` (`id_dyr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eksamen`.`oprindelse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eksamen`.`oprindelse` (
  `id_oprindelse` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `region` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id_oprindelse`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eksamen`.`dyr_has_oprindelse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eksamen`.`dyr_has_oprindelse` (
  `fkey_id_dyr` INT(11) NOT NULL COMMENT '',
  `fkey_id_oprindelse` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`fkey_id_dyr`, `fkey_id_oprindelse`)  COMMENT '',
  INDEX `fk_dyr_has_oprindelse_oprindelse1_idx` (`fkey_id_oprindelse` ASC)  COMMENT '',
  INDEX `fk_dyr_has_oprindelse_dyr_idx` (`fkey_id_dyr` ASC)  COMMENT '',
  CONSTRAINT `fk_dyr_has_oprindelse_dyr`
    FOREIGN KEY (`fkey_id_dyr`)
    REFERENCES `eksamen`.`dyr` (`id_dyr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dyr_has_oprindelse_oprindelse1`
    FOREIGN KEY (`fkey_id_oprindelse`)
    REFERENCES `eksamen`.`oprindelse` (`id_oprindelse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- Kategorier
INSERT INTO kategori (id_kategori,billede) VALUES ('1','Images/kategori/primater.png');
INSERT INTO kategori (id_kategori,billede) VALUES ('2','Images/kategori/fugle.png');
INSERT INTO kategori (id_kategori,billede) VALUES ('3','Images/kategori/edderkopper.png');
INSERT INTO kategori (id_kategori,billede) VALUES ('4','Images/kategori/leddyr.png');
INSERT INTO kategori (id_kategori,billede) VALUES ('5','Images/kategori/padder.png');
INSERT INTO kategori (id_kategori,billede) VALUES ('6','Images/kategori/skildpadder.png');
INSERT INTO kategori (id_kategori,billede) VALUES ('7','Images/kategori/slanger.png');
INSERT INTO kategori (id_kategori,billede) VALUES ('8','Images/kategori/gnavere.png');
INSERT INTO kategori (id_kategori,billede) VALUES ('9','Images/kategori/hovdyr.png');
INSERT INTO kategori (id_kategori,billede) VALUES ('10','Images/kategori/rovdyr.png');

-- Oprindelse, Region
INSERT INTO oprindelse (region) VALUES ('Nord Amerika');
INSERT INTO oprindelse (region) VALUES ('Mellem Amerika');
INSERT INTO oprindelse (region) VALUES ('Syd Amerika');
INSERT INTO oprindelse (region) VALUES ('Nord Europa');
INSERT INTO oprindelse (region) VALUES ('Øst Europa');
INSERT INTO oprindelse (region) VALUES ('Vest Europa');
INSERT INTO oprindelse (region) VALUES ('Syd Europa');
INSERT INTO oprindelse (region) VALUES ('Afrika');
INSERT INTO oprindelse (region) VALUES ('Mellem Afrika');
INSERT INTO oprindelse (region) VALUES ('Nord Afrika');
INSERT INTO oprindelse (region) VALUES ('Syd Afrika');
INSERT INTO oprindelse (region) VALUES ('Øst Afrika');
INSERT INTO oprindelse (region) VALUES ('Vest Afrika');
INSERT INTO oprindelse (region) VALUES ('Asien');
INSERT INTO oprindelse (region) VALUES ('Mellemøsten');
INSERT INTO oprindelse (region) VALUES ('Central Asien');
INSERT INTO oprindelse (region) VALUES ('Øst Asien');
INSERT INTO oprindelse (region) VALUES ('Sydøst Asien');
INSERT INTO oprindelse (region) VALUES ('Stillehavs Øerne');
INSERT INTO oprindelse (region) VALUES ('Australien');
INSERT INTO oprindelse (region) VALUES ('Europa');

-- Dyr
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Dødningenhovedabe','Saimiri sciureus','Kropslængden er fra 25 til 37 centimeter og den har en 37 til 43 cm lang hale. Hanner kan veje op til 1 kg, mens hunner opnår en maksimal vægt på 0,75 kg. Den har kort tæt pels i enten grå- eller olivengrøn, mens hoved, underarme, hænder og fødder er orangegule. Ansigtet er hvidt, mens hætten er sort.','1');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Kapuciner','Cebus Capucinus','Kapucinernas  gripsvans  är fullständigt hårbeklädd på spetsen, så att den visserligen kan tjäna till att haka sig fast med vid trädgrenarna, men inte tjänstgöra som känselredskap eller att ta föda med. Detta släkte skiljer sig från andra primater i  Nya världen  genom rundat huvud och kortare ansikte samt smärtare kroppsform. Ansiktet är naket och ofta rynkigt, vilket ger dem ett bekymrat, åldrigt utseende.','1');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Dværgsilkeabe','Cebuella Pygmaea','Denne  arter verdens mindste  abeart. Dyret når blot en længde på 12-15 cm med en hale på 17-23 cm og en vægt på 100-125 g. Dens føde består af  frugt,  insekter  og plantesaft. Den bliver kønsmoden i 2 årsalderen og kan blive op til 12 år gammel.  ','1');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Sølvsilkeabe  ','Mico Argentatus','Den når en længde på 20-23 cm med en hale på 30-34 cm og vejer 325-350 g. Arten er sølvgrå på ryggen, cremefarvet på bugen og sort på halen. Ansigtet og ørerne er lyserøde. Dyret lever i flokke, hvor der kun findes et ynglepar. De resterende aber hjælper med at beskytte ungerne.','1');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Makakaber','Macaca Radiata','Makakaber er alle frugtspisere, men deres kost omfatter ofte også frø, blade, blomster og andre plantematerialer. Nogle arter spiser også smådyr. Makakaber lever i sociale grupper der kan have op 50 eller flere individer. Mange makakaber bruges som forsøgs dyr,så deres anatomi, fysiologi og adfærd i fangenskab er velkendte, men den naturlige adfærd og økologi er mindre kendte for mange arter.','1');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Grøn marekat','Cercopithecus','Det er middelstore  primater, der sædvanligvis lever i træer. De er  altædende, men æder hovedsageligt  frugter.','1');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Gibbonabe','Hylobates Lar','The fur coloring of the lar gibbon varies from black and dark-brown to light-brown, sandy colors. The hands and feet are white-colored, likewise a ring of white hair surrounds the black face. Both males and females can be all color variants, and the sexes also hardly differ in size.','1');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Kattalemuren','Lemur Catta','Kattalemuren  (Lemur catta) er en  halvabe  i  familien  af  ægte lemurer.  Arten  er den eneste i  slægten  Lemur. Den bliver 39-46 cm lang med en hale på 56-62 cm og vejer 2,5-3,5 kg. Kattalemuren lever udelukkende på  Madagaskar. Den er grå med sorte striber på halen.','1');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Rød varilemur','Varecia Variegata Rubra','Den røde vari lemur er sammen med vari lemuren de største medlemmer af lemurgruppen,  Rød vari lemur lever i familiegrupper beståede af op til 16 medlemmer. De har et territorium, som de forsvarer mod andre grupper af røde varier.','1');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Emu','Dromaius Novaehollandiae','Bestanden menes at ligge på omkring 800.000  individer. Den kan løbe op til 50 km/t og kan blive op til 30 år gammel.    Fuglen har en højde på cirka 150–190 centimeter og en vægt på 30–55 kilogram.','2');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Hvid  Pelikan','Pelecanidae Onocrotalus','Den store hvide pelikan, er en kæmpe fugl. Dens vingefang varierer fra 226 til 360 cm','2');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Blåpandet amazonpapegøje','Amazona Aestiva','Grøn fjerdragt, blå plet over næbbet og rundt om næbbet, gul isse og kinder – hos nogle er også strube, bryst og lår gule. Karakteristisk røde og gule farver på skuldre og svingfjer.. Halen er mellemlang og bred med afrundede spidser – grøn med gult bånd ved spidsen','2');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Brasiliansk fugleedderkop','Lasiodora Parahybana','Den tredje største fugleedderkop i verden. Deres ben bliver op til 28cm, hvor hannerne har længere ben end hunnerne. Dog vejer hunnerne mere, ofte over 100g. Man kan derfor se forskel ved at hannerne ofte er slankere med længere ben, mens hunnerne er lidt krafigere i bygning. Dette kendes som seksuel dismorphisme. De er helt sorte i farven, med lyserøde hår på benene og maven.','3');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Mexikansk fugleedderkop','Brachypelma Auratum','De har mørke kroppe med orange områder omkring ledene. En voksen han bliver omkring 10cm i kropsstørrelse, med ben op til 15cm, og vejer ca. 15g. Begge køn har samme udseende, dog er hannerne ofte mindre med længere ben. Indtil 1992 var denne art ikke set som sin egen, da dens udseende er næsten identisk med en anden art fra samme område.','3');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Chileansk fugleedderkop','Grammostola Rosea','Oprindeligt kommer de fra ørkenområder, hvor de graver huller som de bor i. De kan blive op til 15 år, dog kan nogen hunner kan blive op til 20 år gamle. De bliver gennemsnitligt 10cm i størrelse, men med benene udstrakt kan en fuldvoksen bliver op til 25cm. Ligesom alle edderkopper er denne giftig, og på grund af formen på deres hugtænder kan de bide mennesker. Deres stik beskrives som værende ligesom et hvipsestik.','3');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Afrikanske kæmpetusindeben','Archispirostreptus Gigas','Du ser det måske ikke, men overalt i regnskoven vrimler det med liv. Dykker du ned i underskoven kan du blandt væltede træer og visne blade finde det afrikanske kæmpetusindben, der kan måle helt op til 35 cm. Der findes over 10.000 arter af tusindben, men kæmpetusindbenet er den største nulevende art.','4');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Bladinsekt','Phyllium Giganteum','Bladinsektet er en planteæder – dog kan deres udseende betyde at andre planteædere kan komme til at spise dem! Det er derfor mere ofte at de ender som føde for en anden planteæder, end de rovdyr de faktisk prøver at gemme sig for. De anses for at være store insekter, og måler 3-11cm.','4');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Junglenymphe','Heteropteryx Dilatata','Holder rekorden for det største æg lagt af en insekt. Æggene bliver omkring 1.3cm lange. Selve dyret bliver ca. 10cm lange, dog kan hunnerne blive op til 25cm. Hunnerne er meget aggressive, og er både større og mere farvestrålende end hannerne. Hunnerne har også små vinger, men kan dog ikke flyve. Begge køn har pigge rundt omkring på kroppen, og bruger deres forben som tange til at fange føde med.','4');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Agatudse','Rhinella marina','Agatudsen er en stor, robust tudse, ja faktisk én af verdens største. Den kan blive op til 24 cm lang og veje godt 2 kg – og lidt til! Ifølge Guinness rekordbog målte verdens største agatudse hele 38 cm fra snude til ”halespids” og vejede 2.65 kg. Den levede som kæledyr hos en svensk familie og blev kaldt ”Prinsen”. Som forsvarsmekanisme puster den sig op som en ballon, og tisser på fjenden.','5');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Tomatfrø','Dyscophus antongilii','Tomatfrøer kan bruges til at få en idé om hvor sundt økosystemet og luftkvaliteten er i et naturområde. Det skyldes deres utrolige følsomhed overfor ændringer i naturen, fordi de både trækker vejret igennem lungerne og huden. Hunnerne er noget større end hannerne og kan blive op til 10,5 cm mens hannerne bliver omkring 6,5 cm. Hunnerne vejer omkring 230 g og de noget mindre hanner vejer ca. 41 g. ','5');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Grøn Hjelmbasilisk','Basilicus Plumifrons','Den grønne hjelmbasilisk har tre store kamme som bæres på hoved, ryg og hale. Kammen på hovedet ligner at dyret bærer hjelm hvor af navnet hjelmbasilisk stammer fra. Den grønne hjelmbasilisk lever i træer ved damme, vandløb og floder. Når den trues, lader den sig falde fra sin gren og dykker ned i vandet for at flygte. Denne har en unik evne til at løbe over vandet på bagbenene og har derved fået et andet populært navn ”Jesus Kristus-øgle”. De bliver omkring 60-70cm i længde.','6');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Leopard gekko','Eublepharis Macularius','Det er et  Skumrings- og nataktivt dyr, som har kløer og lever udelukkende i bunden af terrænet. Leopard gekkoen har nopret skind, der føles som fløjl med mørke tegninger på en bund af gule nuancer. Halen er som regel noget tyk og dette skyldes at denne fungerer som fedtdepot. Så er halen godt tyk, har du med en velfungerende leopard gekko at gøre. Leopardgekkoen lever gennemsnitligt 10-15 år, men kan leve helt op til 30 år. De bliver sjældent over 25 cm lange, som gennemsnitligt opnår de en længde på ca. 20 cm som udvoksede.','6');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Pladeøgle','Gerrhosaurus Validus','En stor øgle med flat hoved og krop, og bliver op til 75cm i længde. Dens fodsåler har sorte gummiagtige kugler, som den bruger til at sikkert kravle på skarpe sten og klipper. Den har fået dens navn på grund af de plader den har på ryggen. Som forsvarsmekanisme gør den sig flad og kravler den ind i små åbninger, hvor den så puster sig op og gør det næsten umuligt at hive den ud derfra.','6');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Grøn leguan','Iguana Iguana','En planteæder, som har det tilpasset væsentligt med hensyn til bevægelse og osmoregulering som følge af sin kost. Den kan leve op til 20 år eller mere, og bliver 180-200cm i længede og som fuldvoksen vejer den 5-6kg. Der har dog været nogle eksemplarer som er blevet over 2m, og har vejet op imod 9.1kg. Den er også glad for og god til at svømme, og holder sig ofte tæt på vandområder, da den bruger vandet som en flygtrute hvis den føler sig truet.','6');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Brillekaiman','Caiman Crocodilus','En mindre krokodile art. De har en konklet højderyg mellem øjnene som giver dem udseendet af at have briller – deraf navnet. Hannerne bliver omkring 180-200cm i længde, mens hunnerne er mindre på omkring 120-140cm. De kan veje alt mellem 7-40kg. Den største han blev 250cm og vejede 58kg, og største hun blev 161cm og vejede 20kg. Men de kan potentielt blive helt op til 3m. Brillekaimaner fra Venezuela er efter sigende større end dem fundet i Mexiko.','6');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Mælkesnog','Lampropeltis Triangulum','Den kan bliver mellem 51-152cm I længde. De har en glat og blank krop, og kendes på de farverige ringe langs dens krop, enten rød-sort-gul eller hvid-sort-rød. Nogle mælkesnoge kan godt ligne den giftige koralslange, hvilket hjælper med at afskrække fjender.Heldigvis er mælkesnogen ikke giftige eller til anden fare for mennesker. Her er et lille rim de bruger i Amerika for at hjælpe med at huske forskellen: “Red touches black, you\'re OK, Jack; red touches yellow, you\'re a dead fellow. Red on yellow kills a fellow. Red on black, venom lack.”','7');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Californisk kongesnog','Lampropeltis Caliturnige','Californisk kongesnog er en underart af almindelig kongesnog, som findes over det meste af Nordamerika. Kongesnogens latinske navn Lampropeltis, betyder blankskjoldet og hentyder til dens blanke og glatte skæl. Den californiske kongesnog er kendt for at kunne æde giftslanger som klapperslanger og mokasinslanger. Kongesnogene kvæler deres bytte.','7');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Mørk tigerpython','Python bivittatus','Også kaldet den Burmesiske kvælerslange. Det er en mørkfarvet slange med mange brune pletter omkranset i sort ned ad ryggen. Mønsteret er ens i farve, men forskellige i mønster. De lever tæt på vand, og bruger næsten ligeså meget tid på land som i vand, men kan dog også findes i træer. De kan blive omkring 370cm i længde, med rekord på 574cm. ','7');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Kongeboa','Boa Constrictor','Den er kraftig af bygning, da den skal bruge stærke muskler til at kvæle sit bytte, og kan veje op til 27kg. Hunnerne er som regel større, og vejer 10-15kg og bliver 210-300cm i længde, mens hannerne kun bliver omkring 180-240cm lange. De største eksemplarer kan blive op til 45kg, men dette er yderst sjældent. Deres farver variere meget afhængig af lokaliteten, men de er generelt brune i farven, med brune eller rødbrune ”sadler”, der bliver mere udtalt mod halen.','7');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Lys tigerpython','Python Molurus','De er mønstret med hvidlige eller gullige pletter, og bliver omkring 3m i længde. Rekorden har været 3.6m, hvilket kun to eksemplarer nogensinde er blevet dokumteret som. Den bliver ofte forvekslet med den mørke tigerpython, da de lever i samme områder, og der er derfor begrænset dokumentation om denne art. Nogle mener den kan blive helt op til 4.6m og veje 52kg.','7');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Regnbue boa','Epicrates Cenchria  ','Kendt for deres smukke farve som følge af den iriserende egenskab deres skæl har. De lever tropiske og subtropiske bredbladede skove beskrives som varm og våd. Hannerne når op på 167-183cm i længde. Hunnerne bliver som regel større, og kan nå op på en længde på 180-213cm, og vejer op til 4kg.','7');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Præriehund','Cynomys Ludovicianus','Navnet «hund» har den fået på grund af sin gøende stemme. De har underjordisk hule, og danner mange gravhøje under udgravning. De bor sammen i store grupper og danner et netværk af gange under jorden. En fuldvokesen præriehund kan blive op til 45 cm lang. De sidder lykkeligt oprejst på bagbenene og spejder efter fjender. De er meget sociale dyr, der hilser på hinanden ved at presse deres læber mod hinanden (kysser).','8');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Sumpbæver','Myocastor Coypus','Oprindeligt fra Sydamerika. Den blev introduceret til andre verdensdele, primært gennem pelshandel. De bor i huler langs vandkanten, oftest langs flode. Sumpbæveren er en stor gnaver; kroppen er 40-60 cm lang, halen 30-45 cm og den vejer 5-9 kg. Pelsen er brun eller gulbrun, dog hvid forrest på snuden. Halen er rund og skællet med sparsom hårvækst. På bagfødderne er der svømmehud mellem tæerne. Fortænderne er fremstående og tydeligt gul-orange.','8');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Hulepindsvin','Hystrix Indica','Hulepindsvin er store  gnavere  på 1,5-3,5 kg. De har dele af kroppen dækket af lange børster og pigge. Piggene, som kan blive op til 50 cm lange, har forsvarsfunktion og kan brække af og gennemtrænge en angribers hud. De er ikke giftige, men sårene kan inficeres og blive dødelige selv for løver og leoparder. Hulepindsvin advarer andre dyr om deres tilstedeværelse ved at rasle med piggene.','8');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Dværgodder','Amblonyx Cinereus  ','Også kendt som den  asiatiske dværgodder. Medlem af  mårfamilien. Den bliver 45-61 cm i længde og vejer 3-6 kg. Den er dermed den mindste odderart. Hunodderen får gennemsnitlig 2 unger per kuld, men kan få fra 1 til 6. Dens lange, strømlinede krop gør den dog til en særdeles god svømmer alligevel. Udover at mangle svømmehud mellem tæerne, er dværgodderens kløer så små, at de kun lige dækker det øverste af fingerspidserne – ligesom neglene hos os mennesker. De to ting til sammen gør dværgodderens fingre meget fleksible og følsomme. Og netop fingrene er ét af dværgodderens vigtigste redskaber, når den skal finde føde.','8');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Bennetts wallaby','Macropus Rufogriseus','Også kendt som brunhalset kænguru, dette er et pungdyr. Lever i Australien, samt øen Tasmanien, og er senere blevet introduceret til bl.a. New Zealand. Det er en medium størrelse wallaby. De bliver omkring 90cm i længde, og kan veje 14-19kg, hvor hannerne ofte er større end hunnerne. De kan bliver op til 9 år gamle.','8');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Zebu','Bos Indicus  ','Zebu har pukler på skuldrene, en stor mængde løs hud ved struben og hængende ører. De er tilpasset til det barske miljø i troperne. Tilpasninger omfatter modstand til sygdomme og tolerance af intens varme, sol og fugt. De er yderst udbredte i deres hjemland, hvor de bliver hyrdet, ligesom de køer vi kender herhjemme i Danmark.','9');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Kamel','Camelus Bactrianus','Også kendt som den baktriske kamel.  Den har to pukler og kaldes ofte blot  ”kamel”, mens dens slægtning  Camelus dromedariussom regel kaldes  dromedar,  og alene har en pukkel. Puklerne på dens ryg bruges til at opbevare fedt i og når puklerne er fyldt op, kan kamelen klare sig længe uden vand. Den gennemsnitlige levealder for en kamel er 40 til 50 år. En fuldvoksen voksen kamel står 1,85 m på skulderen og 2,15 m på puklen.] Kameler kan løbe op til 65 km/t.','9');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Lama','Lama Glama','Tilhører familien  kameldyr. Den betragtes som den  domesticerede  form af  guanaco. Lamaen lever i  Andes  i  Sydamerika. I nutiden bruges den stadig som transportdyr i Sydamerika, men ikke så udbredt som tidligere, da den er blevet udkonkurreret af den mekaniserede verden.','9');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Dådyr','Dama Dama','Dådyret er normalt rødbrunt om sommeren med hvide pletter på ryggen, lys bug og ben og en mørk rygstribe, men brunsorte og hvide eksemplarer findes også. Om vinteren bliver dyrene gråbrune uden pletter. Dådyret har en højde på omkring 1,1 meter over skulderen og en hale på 15-20 cm. Handyrene, dåhjortene, vejer omkring 100-120 kg, mens hundyrene, dåerne, vejer omkring 60-80 kg. Dyrene har hvidt spejl (hvid bagdel) med en bred sort indramning, og halen er hvid på undersiden og har en bred sort stribe på oversiden. Man siger derfor at der står \"111\" bag på dådyret. Dyrene bliver op til 16 år gamle.','9');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Elsdyrantilope','Taurotragus Oryx','Også kendt som elandantilope. Et særligt kendetegn for elsdyrantilopen er de lige, tæt spiralsnoede horn. Pelsen er gulbrun og bliver blågrå ved halsen og skuldrene hos de gamle dyr. Det er den næststørste nulevende antilope. Den bliver i gennemsnit 1,6 meter i skulderhøjde og vejer 500-600 kg. Elsdyrantilopens  mælk  er meget  fed  og nærende.','9');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Zebra','Equus Burchellii','Zebraer har karakteristiske mørke og lyse tværstriber. De har lange ører, opadstående  manke  og små  hove. Hver art kendes på stribernes mønstre. Striberne er hvide på sort eller mørkebrun bund, hos føllene dog lys rødbrun. Steppezebraen kan bl.a. kendes på, at der er \"skyggestriber\" i de hvide striber. Zebraen vejer ca. 250 kg. Den måler 240 cm i længden og 125 cm i skulderhøjde.','9');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Næsebjørn','Nasua Nasua','Er en halvbjørn ligesom f.eks.  vaskebjørne  og  kuataquiler, og lever oftest i  lavlandsregnskove, men findes også i  skove  bjergterræn  i grupper på op til 40  individer. Hannerne lever for sig selv undtagen i  parringstiden(januar – februar). De vejer mellem 2,5 og 7 kg og har en  kropslængde  på 47-58 cm og en  halelængde  på 42-55. Halen er ringmønstret.  Pelsfarven  varierer mellem røde og brune farver.  Næsen  er lang og blød, lidt ligesom  gummi, så den kan komme ned i  huller  og  sprækker  med den i søgen efter  føde. Desuden har de lange  kløer  så kan grave efter føden.','10');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Vaskebjørn','Procyon Lotor ','Vaskebjørnen har fået sit navn, fordi det ofte ser ud som om den vasker sin føde. Der er dog mere tale om, at den bruger en kraftigt udviklet følesans i forpoterne til at identificere fødeemner fundet under vand. Vaskebjørnen er  aktiv om natten, hvor den ofte er på besøg i folks haver for at se efter mad i skraldespandene. Den almindelige vaskebjørn måler 60-100 cm og vejer 2-12 kg. Pelsens farve er grå til næsten sort, men ofte er der brun eller rød tone i pelsen. Halen har sorte ringe, og over øjnene bærer vaskebjørnen en sort maske.','10');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Europæisk los','Lynx Lynx','Den kendes let på sine lange ben, spidse ører og korte hale. Lossen er det eneste vilde kattedyr i  Skandinavien. I forhold til andre kattedyr virker lossen mere kvadratisk, fordi skulderhøjden på 50-70 cm omtrent svarer til kropslængden. Halens længde er 11-25 cm. Han-lossens vægt på omkring 20 kg gør det til den største af de fire arter i  los-slægten. Vægten kan dog variere mellem 13 og 37 kg og hunnerne vejer gennemsnitligt 15% mindre end hannerne.','10');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Græsk landskildpadde','Testudo Hermanni','Den befinder sig mest i græsområder hvor den lever af urter, græsser og blomster, men den kan dog godt finde på at spise snegle og ådsler. Holder man græsk landskildpadde i fangenskab bør man undgå at give den frugt da det er skadeligt for skildpadden. Den bliver mellem 15-20cm. Den ligner den  mauriske landskildpadde  og forveksles indimellem med denne, da de lever i samme områder.','6');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Moskus skildpadde','Sternotherus odoratus','De er små sorte, grå eller brune skildpadder med højt hvælvede skaller. De vokser til ca. 5,1-14cm og gennemsnittet i vægt på 603g. De har lange halse og temmelig korte ben. De gule linjer på halsen er en god felt markering, og ofte kan ses fra ovenfor i svømning skildpadder. Hanner kan normalt skelnes fra hunner ved deres betydeligt længere haler og piggen, der rager i slutningen af ​​halen.','6');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Rødøret terrapin','Trachemys Scripta Elegans','Rygskjoldet af denne art kan nå op på mere end 40 cm i længde, men den gennemsnitlige længde varierer fra 15 til 20 cm.Hunnerne af de arter er som regel større end hannerne. De lever typisk mellem 20 og 30 år, selv om nogle individer har levet i mere end 40 år. De er helt afhængige af temperaturen i deres miljø. Af denne grund har de brug for at solbade ofte for at varme sig og opretholde deres kropstemperatur.','6');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Snapskildpadde','Chelydra Serpentina','De lever tæt på vand, hvilket de bruger til at flygte, og skjuler sig under vandet i sedimentet. Nordlige populationer modnes senere (ved 15-20 år), og bliver generelt større end i mere sydlige populationer (ca. 12 år). Levetid i naturen er dårligt kendt, men langsigtede data fra Algonquin Park i Ontario, Canada, foreslå en maksimal alder over 100 år.','6');
INSERT INTO dyr (navn,art,information,fkey_id_kategori) VALUES ('Æskeskildpadde','Terrapene carolina major','De har en kuppelformet skal, der kan vokse til omkring 20cm i længden. De er generelt mørkbrun eller sort farvede, med gule striber eller pletter.  Mængden af ​pletter og striber kan variere en hel del. De lever oftest omkring flodmundinger og sumpede områder, nær overfladisk, permanente vandområder.','6');

-- Dyrs forskellige oprindelser
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('2','2');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('2','3');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('3','3');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('4','3');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('5','14');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('6','10');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('7','18');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('8','12');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('9','12');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('10','20');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('11','7');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('11','5');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('11','14');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('11','8');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('12','3');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('13','3');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('14','3');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('15','3');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('16','8');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('17','14');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('18','18');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('19','3');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('20','12');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('21','2');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('21','3');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('22','14');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('23','2');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('23','3');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('24','2');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('24','3');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('25','2');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('25','3');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('26','1');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('26','2');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('27','1');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('28','18');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('29','1');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('29','2');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('29','3');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('30','18');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('31','2');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('31','3');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('32','1');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('32','2');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('33','1');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('33','3');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('33','5');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('33','6');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('33','14');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('33','12');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('34','18');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('34','15');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('35','14');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('36','20');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('37','18');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('38','14');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('39','3');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('40','21');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('41','8');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('42','11');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('42','12');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('43','1');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('43','2');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('43','3');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('44','1');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('44','21');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('45','21');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('45','14');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('46','7');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('47','1');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('48','1');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('49','1');
INSERT INTO dyr_has_oprindelse (fkey_id_dyr,fkey_id_oprindelse) VALUES ('50','1');


-- forskellige billeder pr. dyr. DER ER KUN EKSEMPLER INDTIL VIDERE.
Update kategori SET billede='images/primater.jpg' WHERE id_kategori = 1;

SELECT navn, art, billeder.billede, information, region, kategori, kategori.billede, id_kategori, id_oprindelse
FROM kategori, dyr, billeder, dyr_has_oprindelse, oprindelse
WHERE id_dyr = 1
AND id_dyr = billeder.fkey_id_dyr
AND id_dyr = dyr_has_oprindelse.fkey_id_dyr
AND fkey_id_oprindelse = id_oprindelse
AND id_kategori = fkey_id_kategori
GROUP BY id_dyr ORDER BY id_dyr DESC;

select * from kategori;