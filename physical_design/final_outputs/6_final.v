module processor (clk,
    enable,
    reset,
    debug_alu_result,
    debug_instruction,
    debug_memory_read_data,
    debug_pc,
    debug_write_back_data);
 input clk;
 input enable;
 input reset;
 output [31:0] debug_alu_result;
 output [31:0] debug_instruction;
 output [31:0] debug_memory_read_data;
 output [31:0] debug_pc;
 output [31:0] debug_write_back_data;

 wire \IF_ID.pc_in[2] ;
 wire \IF_ID.pc_in[3] ;
 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire net259;
 wire net258;
 wire net257;
 wire _070_;
 wire _071_;
 wire net256;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _082_;
 wire _083_;
 wire _084_;
 wire _085_;
 wire _086_;
 wire _087_;
 wire _088_;
 wire _089_;
 wire _090_;
 wire _091_;
 wire _092_;
 wire _093_;
 wire _094_;
 wire _095_;
 wire _096_;
 wire _097_;
 wire _098_;
 wire _099_;
 wire _100_;
 wire _101_;
 wire _102_;
 wire _103_;
 wire _104_;
 wire _105_;
 wire _106_;
 wire _107_;
 wire _108_;
 wire _109_;
 wire _110_;
 wire _111_;
 wire _112_;
 wire _113_;
 wire _114_;
 wire _115_;
 wire _116_;
 wire _117_;
 wire _118_;
 wire _119_;
 wire net260;
 wire net132;
 wire net133;
 wire net134;
 wire net135;
 wire net136;
 wire net137;
 wire net138;
 wire net139;
 wire net140;
 wire net141;
 wire net142;
 wire net143;
 wire net144;
 wire net145;
 wire net146;
 wire net147;
 wire net148;
 wire net149;
 wire net150;
 wire net151;
 wire net152;
 wire net153;
 wire net154;
 wire net155;
 wire net156;
 wire net157;
 wire net158;
 wire net159;
 wire net160;
 wire net161;
 wire net130;
 wire net131;
 wire net255;
 wire net254;
 wire net253;
 wire net252;
 wire net251;
 wire net250;
 wire net249;
 wire net248;
 wire net247;
 wire net246;
 wire net245;
 wire net244;
 wire net243;
 wire net242;
 wire net241;
 wire net240;
 wire net239;
 wire net238;
 wire net237;
 wire net236;
 wire net235;
 wire net234;
 wire net233;
 wire net232;
 wire net231;
 wire net230;
 wire net229;
 wire net228;
 wire net227;
 wire net226;
 wire net225;
 wire net224;
 wire net223;
 wire net222;
 wire net221;
 wire net220;
 wire net219;
 wire net218;
 wire net217;
 wire net216;
 wire net215;
 wire net214;
 wire net213;
 wire net212;
 wire net211;
 wire net210;
 wire net209;
 wire net208;
 wire net207;
 wire net206;
 wire net205;
 wire net204;
 wire net203;
 wire net202;
 wire net201;
 wire net200;
 wire net199;
 wire net198;
 wire net197;
 wire net196;
 wire net195;
 wire net194;
 wire net193;
 wire net192;
 wire net191;
 wire net190;
 wire net189;
 wire net188;
 wire net187;
 wire net186;
 wire net185;
 wire net184;
 wire net183;
 wire net182;
 wire net181;
 wire net180;
 wire net179;
 wire net178;
 wire net177;
 wire net176;
 wire net175;
 wire net174;
 wire net173;
 wire net172;
 wire net171;
 wire net170;
 wire net169;
 wire net168;
 wire net167;
 wire net166;
 wire net165;
 wire net164;
 wire clknet_2_3__leaf_clk;
 wire clknet_2_2__leaf_clk;
 wire clknet_2_1__leaf_clk;
 wire clknet_2_0__leaf_clk;
 wire net163;
 wire clknet_0_clk;
 wire net261;
 wire net262;
 wire net263;
 wire net264;
 wire net265;
 wire net266;
 wire net267;
 wire net268;
 wire net269;
 wire net270;
 wire net271;
 wire net272;
 wire net273;
 wire net274;
 wire net275;
 wire net276;

 DFFR_X1 \PC.pc[10]$_DFFE_PP0P_  (.D(net201),
    .RN(_001_),
    .CK(clknet_2_1__leaf_clk),
    .Q(net132),
    .QN(_099_));
 DFFR_X1 \PC.pc[11]$_DFFE_PP0P_  (.D(net205),
    .RN(_001_),
    .CK(clknet_2_1__leaf_clk),
    .Q(net133),
    .QN(_100_));
 DFFR_X1 \PC.pc[12]$_DFFE_PP0P_  (.D(net181),
    .RN(net163),
    .CK(clknet_2_1__leaf_clk),
    .Q(net134),
    .QN(_101_));
 DFFR_X1 \PC.pc[13]$_DFFE_PP0P_  (.D(net183),
    .RN(net163),
    .CK(clknet_2_3__leaf_clk),
    .Q(net135),
    .QN(_102_));
 DFFR_X1 \PC.pc[14]$_DFFE_PP0P_  (.D(net203),
    .RN(net163),
    .CK(clknet_2_3__leaf_clk),
    .Q(net136),
    .QN(_103_));
 DFFR_X1 \PC.pc[15]$_DFFE_PP0P_  (.D(net195),
    .RN(net163),
    .CK(clknet_2_2__leaf_clk),
    .Q(net137),
    .QN(_104_));
 DFFR_X1 \PC.pc[16]$_DFFE_PP0P_  (.D(net187),
    .RN(net163),
    .CK(clknet_2_2__leaf_clk),
    .Q(net138),
    .QN(_105_));
 DFFR_X1 \PC.pc[17]$_DFFE_PP0P_  (.D(net191),
    .RN(net163),
    .CK(clknet_2_0__leaf_clk),
    .Q(net139),
    .QN(_106_));
 DFFR_X1 \PC.pc[18]$_DFFE_PP0P_  (.D(net179),
    .RN(net163),
    .CK(clknet_2_0__leaf_clk),
    .Q(net140),
    .QN(_107_));
 DFFR_X1 \PC.pc[19]$_DFFE_PP0P_  (.D(net189),
    .RN(net163),
    .CK(clknet_2_2__leaf_clk),
    .Q(net141),
    .QN(_108_));
 DFFR_X1 \PC.pc[20]$_DFFE_PP0P_  (.D(net171),
    .RN(net163),
    .CK(clknet_2_2__leaf_clk),
    .Q(net142),
    .QN(_109_));
 DFFR_X1 \PC.pc[21]$_DFFE_PP0P_  (.D(net169),
    .RN(net163),
    .CK(clknet_2_2__leaf_clk),
    .Q(net143),
    .QN(_110_));
 DFFR_X1 \PC.pc[22]$_DFFE_PP0P_  (.D(net209),
    .RN(net163),
    .CK(clknet_2_2__leaf_clk),
    .Q(net144),
    .QN(_111_));
 DFFR_X1 \PC.pc[23]$_DFFE_PP0P_  (.D(net199),
    .RN(net163),
    .CK(clknet_2_2__leaf_clk),
    .Q(net145),
    .QN(_112_));
 DFFR_X1 \PC.pc[24]$_DFFE_PP0P_  (.D(net216),
    .RN(_001_),
    .CK(clknet_2_3__leaf_clk),
    .Q(net146),
    .QN(_113_));
 DFFR_X1 \PC.pc[25]$_DFFE_PP0P_  (.D(net177),
    .RN(_001_),
    .CK(clknet_2_3__leaf_clk),
    .Q(net147),
    .QN(_114_));
 DFFR_X1 \PC.pc[26]$_DFFE_PP0P_  (.D(net222),
    .RN(_001_),
    .CK(clknet_2_3__leaf_clk),
    .Q(net148),
    .QN(_115_));
 DFFR_X1 \PC.pc[27]$_DFFE_PP0P_  (.D(net173),
    .RN(_001_),
    .CK(clknet_2_3__leaf_clk),
    .Q(net149),
    .QN(_116_));
 DFFR_X1 \PC.pc[28]$_DFFE_PP0P_  (.D(net185),
    .RN(net163),
    .CK(clknet_2_3__leaf_clk),
    .Q(net150),
    .QN(_117_));
 DFFR_X1 \PC.pc[29]$_DFFE_PP0P_  (.D(net225),
    .RN(net163),
    .CK(clknet_2_3__leaf_clk),
    .Q(net151),
    .QN(_118_));
 DFFR_X1 \PC.pc[2]$_DFFE_PP0P_  (.D(net165),
    .RN(_001_),
    .CK(clknet_2_0__leaf_clk),
    .Q(net152),
    .QN(\IF_ID.pc_in[2] ));
 DFFR_X1 \PC.pc[30]$_DFFE_PP0P_  (.D(net175),
    .RN(net163),
    .CK(clknet_2_3__leaf_clk),
    .Q(net153),
    .QN(_119_));
 DFFR_X1 \PC.pc[31]$_DFFE_PP0P_  (.D(net167),
    .RN(net163),
    .CK(clknet_2_2__leaf_clk),
    .Q(net154),
    .QN(_091_));
 DFFR_X1 \PC.pc[3]$_DFFE_PP0P_  (.D(net227),
    .RN(_001_),
    .CK(clknet_2_0__leaf_clk),
    .Q(net155),
    .QN(_092_));
 DFFR_X1 \PC.pc[4]$_DFFE_PP0P_  (.D(net211),
    .RN(_001_),
    .CK(clknet_2_0__leaf_clk),
    .Q(net156),
    .QN(_093_));
 DFFR_X1 \PC.pc[5]$_DFFE_PP0P_  (.D(net207),
    .RN(_001_),
    .CK(clknet_2_1__leaf_clk),
    .Q(net157),
    .QN(_094_));
 DFFR_X1 \PC.pc[6]$_DFFE_PP0P_  (.D(net197),
    .RN(_001_),
    .CK(clknet_2_1__leaf_clk),
    .Q(net158),
    .QN(_095_));
 DFFR_X1 \PC.pc[7]$_DFFE_PP0P_  (.D(net193),
    .RN(_001_),
    .CK(clknet_2_2__leaf_clk),
    .Q(net159),
    .QN(_096_));
 DFFR_X1 \PC.pc[8]$_DFFE_PP0P_  (.D(net213),
    .RN(_001_),
    .CK(clknet_2_1__leaf_clk),
    .Q(net160),
    .QN(_097_));
 DFFR_X1 \PC.pc[9]$_DFFE_PP0P_  (.D(net219),
    .RN(_001_),
    .CK(clknet_2_1__leaf_clk),
    .Q(net161),
    .QN(_098_));
 NAND3_X1 _123_ (.A1(net200),
    .A2(net217),
    .A3(net212),
    .ZN(_076_));
 NAND3_X2 _124_ (.A1(net236),
    .A2(net192),
    .A3(net266),
    .ZN(_077_));
 NAND2_X1 _125_ (.A1(net180),
    .A2(net204),
    .ZN(_078_));
 NOR4_X1 _126_ (.A1(_070_),
    .A2(_076_),
    .A3(_077_),
    .A4(_078_),
    .ZN(_079_));
 XOR2_X1 _127_ (.A(net182),
    .B(_079_),
    .Z(_019_));
 OR2_X1 _128_ (.A1(_070_),
    .A2(_071_),
    .ZN(_080_));
 NOR2_X1 _129_ (.A1(_080_),
    .A2(_073_),
    .ZN(_081_));
 XOR2_X1 _130_ (.A(net180),
    .B(_081_),
    .Z(_020_));
 NOR3_X1 _131_ (.A1(_070_),
    .A2(_076_),
    .A3(_077_),
    .ZN(_082_));
 XOR2_X1 _132_ (.A(net204),
    .B(_082_),
    .Z(_021_));
 INV_X1 _134_ (.A(net217),
    .ZN(_083_));
 INV_X1 _135_ (.A(net212),
    .ZN(_084_));
 NOR3_X1 _136_ (.A1(_083_),
    .A2(_084_),
    .A3(_080_),
    .ZN(_085_));
 XOR2_X1 _137_ (.A(net200),
    .B(_085_),
    .Z(_022_));
 NOR3_X1 _138_ (.A1(_084_),
    .A2(_070_),
    .A3(_077_),
    .ZN(_086_));
 XNOR2_X1 _139_ (.A(net218),
    .B(_086_),
    .ZN(_023_));
 XNOR2_X1 _140_ (.A(net212),
    .B(_080_),
    .ZN(_024_));
 NAND2_X1 _141_ (.A1(net236),
    .A2(net226),
    .ZN(_087_));
 NOR2_X1 _142_ (.A1(_070_),
    .A2(_087_),
    .ZN(_088_));
 XOR2_X1 _143_ (.A(net192),
    .B(_088_),
    .Z(_025_));
 NAND4_X4 _144_ (.A1(net206),
    .A2(net210),
    .A3(net130),
    .A4(net196),
    .ZN(_070_));
 NAND4_X1 _145_ (.A1(net206),
    .A2(net210),
    .A3(net130),
    .A4(_000_),
    .ZN(_089_));
 XNOR2_X1 _146_ (.A(net196),
    .B(_089_),
    .ZN(_026_));
 NAND4_X1 _147_ (.A1(net236),
    .A2(net210),
    .A3(net130),
    .A4(net226),
    .ZN(_090_));
 XNOR2_X1 _148_ (.A(net206),
    .B(_090_),
    .ZN(_027_));
 NAND2_X1 _149_ (.A1(net130),
    .A2(_000_),
    .ZN(_032_));
 XNOR2_X1 _150_ (.A(net210),
    .B(_032_),
    .ZN(_028_));
 MUX2_X1 _151_ (.A(net226),
    .B(\IF_ID.pc_in[3] ),
    .S(net130),
    .Z(_029_));
 MUX2_X1 _152_ (.A(net272),
    .B(net229),
    .S(net130),
    .Z(_030_));
 AND4_X1 _153_ (.A1(net220),
    .A2(net176),
    .A3(net146),
    .A4(net172),
    .ZN(_033_));
 NAND4_X1 _154_ (.A1(net184),
    .A2(net223),
    .A3(net174),
    .A4(_033_),
    .ZN(_034_));
 NAND2_X1 _155_ (.A1(net192),
    .A2(_000_),
    .ZN(_071_));
 OR4_X4 _156_ (.A1(_070_),
    .A2(_073_),
    .A3(_074_),
    .A4(_077_),
    .ZN(_035_));
 AND4_X1 _157_ (.A1(net178),
    .A2(net139),
    .A3(net141),
    .A4(net142),
    .ZN(_036_));
 AND4_X1 _158_ (.A1(net136),
    .A2(net137),
    .A3(net138),
    .A4(net143),
    .ZN(_037_));
 NAND4_X4 _159_ (.A1(net208),
    .A2(net198),
    .A3(_036_),
    .A4(_037_),
    .ZN(_038_));
 NOR3_X1 _160_ (.A1(_034_),
    .A2(_035_),
    .A3(_038_),
    .ZN(_039_));
 XOR2_X1 _161_ (.A(net232),
    .B(_039_),
    .Z(_031_));
 INV_X1 _162_ (.A(net131),
    .ZN(_001_));
 NAND3_X1 _163_ (.A1(net202),
    .A2(net182),
    .A3(_079_),
    .ZN(_040_));
 XNOR2_X1 _164_ (.A(net194),
    .B(_040_),
    .ZN(_017_));
 INV_X1 _165_ (.A(net223),
    .ZN(_041_));
 NAND2_X1 _167_ (.A1(net184),
    .A2(_033_),
    .ZN(_042_));
 NOR4_X4 _168_ (.A1(_041_),
    .A2(_075_),
    .A3(_042_),
    .A4(_038_),
    .ZN(_043_));
 XOR2_X2 _169_ (.A(net174),
    .B(_043_),
    .Z(_002_));
 NOR3_X1 _170_ (.A1(_042_),
    .A2(_035_),
    .A3(_038_),
    .ZN(_044_));
 XNOR2_X1 _171_ (.A(net224),
    .B(_044_),
    .ZN(_003_));
 INV_X1 _172_ (.A(_033_),
    .ZN(_045_));
 NOR3_X1 _173_ (.A1(_075_),
    .A2(_045_),
    .A3(_038_),
    .ZN(_046_));
 XOR2_X1 _174_ (.A(net184),
    .B(_046_),
    .Z(_004_));
 INV_X1 _175_ (.A(net220),
    .ZN(_047_));
 NAND2_X1 _176_ (.A1(net176),
    .A2(net214),
    .ZN(_048_));
 NAND4_X4 _177_ (.A1(net204),
    .A2(net200),
    .A3(net217),
    .A4(net274),
    .ZN(_073_));
 NOR4_X4 _178_ (.A1(_047_),
    .A2(_048_),
    .A3(_035_),
    .A4(_038_),
    .ZN(_049_));
 XOR2_X2 _179_ (.A(net172),
    .B(_049_),
    .Z(_005_));
 NOR3_X1 _180_ (.A1(_075_),
    .A2(_048_),
    .A3(_038_),
    .ZN(_050_));
 XNOR2_X1 _181_ (.A(net221),
    .B(_050_),
    .ZN(_006_));
 INV_X1 _182_ (.A(net214),
    .ZN(_051_));
 NOR3_X1 _183_ (.A1(_051_),
    .A2(_035_),
    .A3(_038_),
    .ZN(_052_));
 XOR2_X1 _184_ (.A(net176),
    .B(_052_),
    .Z(_007_));
 NOR2_X1 _185_ (.A1(_075_),
    .A2(_038_),
    .ZN(_053_));
 XNOR2_X1 _186_ (.A(net215),
    .B(_053_),
    .ZN(_008_));
 NOR4_X1 _187_ (.A1(_070_),
    .A2(_073_),
    .A3(_074_),
    .A4(_077_),
    .ZN(_054_));
 NAND2_X1 _188_ (.A1(net182),
    .A2(net180),
    .ZN(_074_));
 AND2_X1 _189_ (.A1(_036_),
    .A2(_037_),
    .ZN(_055_));
 NAND3_X1 _190_ (.A1(net208),
    .A2(_054_),
    .A3(_055_),
    .ZN(_056_));
 XNOR2_X1 _191_ (.A(net198),
    .B(_056_),
    .ZN(_009_));
 NOR4_X2 _192_ (.A1(_070_),
    .A2(_071_),
    .A3(_073_),
    .A4(_074_),
    .ZN(_057_));
 NAND2_X1 _193_ (.A1(_057_),
    .A2(_055_),
    .ZN(_058_));
 XNOR2_X1 _194_ (.A(net208),
    .B(_058_),
    .ZN(_010_));
 AND3_X1 _195_ (.A1(net136),
    .A2(net137),
    .A3(net186),
    .ZN(_059_));
 NAND3_X1 _196_ (.A1(_054_),
    .A2(_036_),
    .A3(_059_),
    .ZN(_060_));
 XNOR2_X1 _197_ (.A(net234),
    .B(_060_),
    .ZN(_011_));
 AND2_X1 _198_ (.A1(net178),
    .A2(net190),
    .ZN(_061_));
 OR4_X4 _199_ (.A1(_070_),
    .A2(_071_),
    .A3(_073_),
    .A4(_074_),
    .ZN(_075_));
 NAND4_X1 _200_ (.A1(net188),
    .A2(_057_),
    .A3(_061_),
    .A4(_059_),
    .ZN(_062_));
 XNOR2_X1 _201_ (.A(net239),
    .B(_062_),
    .ZN(_012_));
 NAND3_X1 _202_ (.A1(_054_),
    .A2(_061_),
    .A3(_059_),
    .ZN(_063_));
 XNOR2_X1 _203_ (.A(net248),
    .B(_063_),
    .ZN(_013_));
 NAND3_X1 _204_ (.A1(net190),
    .A2(_057_),
    .A3(_059_),
    .ZN(_064_));
 XNOR2_X1 _205_ (.A(net242),
    .B(_064_),
    .ZN(_014_));
 NAND2_X1 _206_ (.A1(_054_),
    .A2(_059_),
    .ZN(_065_));
 XNOR2_X1 _207_ (.A(net190),
    .B(_065_),
    .ZN(_015_));
 NAND3_X1 _208_ (.A1(net202),
    .A2(net194),
    .A3(_057_),
    .ZN(_066_));
 XNOR2_X1 _209_ (.A(net245),
    .B(_066_),
    .ZN(_016_));
 XNOR2_X1 _210_ (.A(net202),
    .B(_075_),
    .ZN(_018_));
 HA_X1 _211_ (.A(net236),
    .B(net226),
    .CO(_000_),
    .S(\IF_ID.pc_in[3] ));
 LOGIC0_X1 _213__1 (.Z(debug_alu_result[0]));
 LOGIC0_X1 _214__2 (.Z(debug_alu_result[1]));
 LOGIC0_X1 _215__3 (.Z(debug_alu_result[2]));
 LOGIC0_X1 _216__4 (.Z(debug_alu_result[3]));
 LOGIC0_X1 _217__5 (.Z(debug_alu_result[4]));
 LOGIC0_X1 _218__6 (.Z(debug_alu_result[5]));
 LOGIC0_X1 _219__7 (.Z(debug_alu_result[6]));
 LOGIC0_X1 _220__8 (.Z(debug_alu_result[7]));
 LOGIC0_X1 _221__9 (.Z(debug_alu_result[8]));
 LOGIC0_X1 _222__10 (.Z(debug_alu_result[9]));
 LOGIC0_X1 _223__11 (.Z(debug_alu_result[10]));
 LOGIC0_X1 _224__12 (.Z(debug_alu_result[11]));
 LOGIC0_X1 _225__13 (.Z(debug_alu_result[12]));
 LOGIC0_X1 _226__14 (.Z(debug_alu_result[13]));
 LOGIC0_X1 _227__15 (.Z(debug_alu_result[14]));
 LOGIC0_X1 _228__16 (.Z(debug_alu_result[15]));
 LOGIC0_X1 _229__17 (.Z(debug_alu_result[16]));
 LOGIC0_X1 _230__18 (.Z(debug_alu_result[17]));
 LOGIC0_X1 _231__19 (.Z(debug_alu_result[18]));
 LOGIC0_X1 _232__20 (.Z(debug_alu_result[19]));
 LOGIC0_X1 _233__21 (.Z(debug_alu_result[20]));
 LOGIC0_X1 _234__22 (.Z(debug_alu_result[21]));
 LOGIC0_X1 _235__23 (.Z(debug_alu_result[22]));
 LOGIC0_X1 _236__24 (.Z(debug_alu_result[23]));
 LOGIC0_X1 _237__25 (.Z(debug_alu_result[24]));
 LOGIC0_X1 _238__26 (.Z(debug_alu_result[25]));
 LOGIC0_X1 _239__27 (.Z(debug_alu_result[26]));
 LOGIC0_X1 _240__28 (.Z(debug_alu_result[27]));
 LOGIC0_X1 _241__29 (.Z(debug_alu_result[28]));
 LOGIC0_X1 _242__30 (.Z(debug_alu_result[29]));
 LOGIC0_X1 _243__31 (.Z(debug_alu_result[30]));
 LOGIC0_X1 _244__32 (.Z(debug_alu_result[31]));
 LOGIC0_X1 _245__33 (.Z(debug_instruction[0]));
 LOGIC0_X1 _246__34 (.Z(debug_instruction[1]));
 LOGIC0_X1 _247__35 (.Z(debug_instruction[2]));
 LOGIC0_X1 _248__36 (.Z(debug_instruction[3]));
 LOGIC0_X1 _249__37 (.Z(debug_instruction[4]));
 LOGIC0_X1 _250__38 (.Z(debug_instruction[5]));
 LOGIC0_X1 _251__39 (.Z(debug_instruction[6]));
 LOGIC0_X1 _252__40 (.Z(debug_instruction[7]));
 LOGIC0_X1 _253__41 (.Z(debug_instruction[8]));
 LOGIC0_X1 _254__42 (.Z(debug_instruction[9]));
 LOGIC0_X1 _255__43 (.Z(debug_instruction[10]));
 LOGIC0_X1 _256__44 (.Z(debug_instruction[11]));
 LOGIC0_X1 _257__45 (.Z(debug_instruction[12]));
 LOGIC0_X1 _258__46 (.Z(debug_instruction[13]));
 LOGIC0_X1 _259__47 (.Z(debug_instruction[14]));
 LOGIC0_X1 _260__48 (.Z(debug_instruction[15]));
 LOGIC0_X1 _261__49 (.Z(debug_instruction[16]));
 LOGIC0_X1 _262__50 (.Z(debug_instruction[17]));
 LOGIC0_X1 _263__51 (.Z(debug_instruction[18]));
 LOGIC0_X1 _264__52 (.Z(debug_instruction[19]));
 LOGIC0_X1 _265__53 (.Z(debug_instruction[20]));
 LOGIC0_X1 _266__54 (.Z(debug_instruction[21]));
 LOGIC0_X1 _267__55 (.Z(debug_instruction[22]));
 LOGIC0_X1 _268__56 (.Z(debug_instruction[23]));
 LOGIC0_X1 _269__57 (.Z(debug_instruction[24]));
 LOGIC0_X1 _270__58 (.Z(debug_instruction[25]));
 LOGIC0_X1 _271__59 (.Z(debug_instruction[26]));
 LOGIC0_X1 _272__60 (.Z(debug_instruction[27]));
 LOGIC0_X1 _273__61 (.Z(debug_instruction[28]));
 LOGIC0_X1 _274__62 (.Z(debug_instruction[29]));
 LOGIC0_X1 _275__63 (.Z(debug_instruction[30]));
 LOGIC0_X1 _276__64 (.Z(debug_instruction[31]));
 LOGIC0_X1 _277__65 (.Z(debug_memory_read_data[0]));
 LOGIC0_X1 _278__66 (.Z(debug_memory_read_data[1]));
 LOGIC0_X1 _279__67 (.Z(debug_memory_read_data[2]));
 LOGIC0_X1 _280__68 (.Z(debug_memory_read_data[3]));
 LOGIC0_X1 _281__69 (.Z(debug_memory_read_data[4]));
 LOGIC0_X1 _282__70 (.Z(debug_memory_read_data[5]));
 LOGIC0_X1 _283__71 (.Z(debug_memory_read_data[6]));
 LOGIC0_X1 _284__72 (.Z(debug_memory_read_data[7]));
 LOGIC0_X1 _285__73 (.Z(debug_memory_read_data[8]));
 LOGIC0_X1 _286__74 (.Z(debug_memory_read_data[9]));
 LOGIC0_X1 _287__75 (.Z(debug_memory_read_data[10]));
 LOGIC0_X1 _288__76 (.Z(debug_memory_read_data[11]));
 LOGIC0_X1 _289__77 (.Z(debug_memory_read_data[12]));
 LOGIC0_X1 _290__78 (.Z(debug_memory_read_data[13]));
 LOGIC0_X1 _291__79 (.Z(debug_memory_read_data[14]));
 LOGIC0_X1 _292__80 (.Z(debug_memory_read_data[15]));
 LOGIC0_X1 _293__81 (.Z(debug_memory_read_data[16]));
 LOGIC0_X1 _294__82 (.Z(debug_memory_read_data[17]));
 LOGIC0_X1 _295__83 (.Z(debug_memory_read_data[18]));
 LOGIC0_X1 _296__84 (.Z(debug_memory_read_data[19]));
 LOGIC0_X1 _297__85 (.Z(debug_memory_read_data[20]));
 LOGIC0_X1 _298__86 (.Z(debug_memory_read_data[21]));
 LOGIC0_X1 _299__87 (.Z(debug_memory_read_data[22]));
 LOGIC0_X1 _300__88 (.Z(debug_memory_read_data[23]));
 LOGIC0_X1 _301__89 (.Z(debug_memory_read_data[24]));
 LOGIC0_X1 _302__90 (.Z(debug_memory_read_data[25]));
 LOGIC0_X1 _303__91 (.Z(debug_memory_read_data[26]));
 LOGIC0_X1 _304__92 (.Z(debug_memory_read_data[27]));
 LOGIC0_X1 _305__93 (.Z(debug_memory_read_data[28]));
 LOGIC0_X1 _306__94 (.Z(debug_memory_read_data[29]));
 LOGIC0_X1 _307__95 (.Z(debug_memory_read_data[30]));
 LOGIC0_X1 _308__96 (.Z(debug_memory_read_data[31]));
 LOGIC0_X1 _309__97 (.Z(debug_pc[0]));
 LOGIC0_X1 _310__98 (.Z(debug_pc[1]));
 LOGIC0_X1 _311__99 (.Z(debug_write_back_data[0]));
 LOGIC0_X1 _312__100 (.Z(debug_write_back_data[1]));
 LOGIC0_X1 _313__101 (.Z(debug_write_back_data[2]));
 LOGIC0_X1 _314__102 (.Z(debug_write_back_data[3]));
 LOGIC0_X1 _315__103 (.Z(debug_write_back_data[4]));
 LOGIC0_X1 _316__104 (.Z(debug_write_back_data[5]));
 LOGIC0_X1 _317__105 (.Z(debug_write_back_data[6]));
 LOGIC0_X1 _318__106 (.Z(debug_write_back_data[7]));
 LOGIC0_X1 _319__107 (.Z(debug_write_back_data[8]));
 LOGIC0_X1 _320__108 (.Z(debug_write_back_data[9]));
 LOGIC0_X1 _321__109 (.Z(debug_write_back_data[10]));
 LOGIC0_X1 _322__110 (.Z(debug_write_back_data[11]));
 LOGIC0_X1 _323__111 (.Z(debug_write_back_data[12]));
 LOGIC0_X1 _324__112 (.Z(debug_write_back_data[13]));
 LOGIC0_X1 _325__113 (.Z(debug_write_back_data[14]));
 LOGIC0_X1 _326__114 (.Z(debug_write_back_data[15]));
 LOGIC0_X1 _327__115 (.Z(debug_write_back_data[16]));
 LOGIC0_X1 _328__116 (.Z(debug_write_back_data[17]));
 LOGIC0_X1 _329__117 (.Z(debug_write_back_data[18]));
 LOGIC0_X1 _330__118 (.Z(debug_write_back_data[19]));
 LOGIC0_X1 _331__119 (.Z(debug_write_back_data[20]));
 LOGIC0_X1 _332__120 (.Z(debug_write_back_data[21]));
 LOGIC0_X1 _333__121 (.Z(debug_write_back_data[22]));
 LOGIC0_X1 _334__122 (.Z(debug_write_back_data[23]));
 LOGIC0_X1 _335__123 (.Z(debug_write_back_data[24]));
 LOGIC0_X1 _336__124 (.Z(debug_write_back_data[25]));
 LOGIC0_X1 _337__125 (.Z(debug_write_back_data[26]));
 LOGIC0_X1 _338__126 (.Z(debug_write_back_data[27]));
 LOGIC0_X1 _339__127 (.Z(debug_write_back_data[28]));
 LOGIC0_X1 _340__128 (.Z(debug_write_back_data[29]));
 LOGIC0_X1 _341__129 (.Z(debug_write_back_data[30]));
 LOGIC0_X1 _342__130 (.Z(debug_write_back_data[31]));
 CLKBUF_X3 clkbuf_0_clk (.A(clk),
    .Z(clknet_0_clk));
 CLKBUF_X3 clkbuf_2_0__f_clk (.A(clknet_0_clk),
    .Z(clknet_2_0__leaf_clk));
 CLKBUF_X3 clkbuf_2_1__f_clk (.A(clknet_0_clk),
    .Z(clknet_2_1__leaf_clk));
 CLKBUF_X3 clkbuf_2_2__f_clk (.A(clknet_0_clk),
    .Z(clknet_2_2__leaf_clk));
 CLKBUF_X3 clkbuf_2_3__f_clk (.A(clknet_0_clk),
    .Z(clknet_2_3__leaf_clk));
 INV_X2 clkload0 (.A(clknet_2_0__leaf_clk));
 INV_X1 clkload1 (.A(clknet_2_1__leaf_clk));
 CLKBUF_X1 hold165 (.A(net228),
    .Z(net164));
 CLKBUF_X1 hold166 (.A(net230),
    .Z(net165));
 CLKBUF_X1 hold167 (.A(net231),
    .Z(net166));
 CLKBUF_X1 hold168 (.A(_031_),
    .Z(net167));
 CLKBUF_X1 hold169 (.A(net233),
    .Z(net168));
 CLKBUF_X1 hold170 (.A(net235),
    .Z(net169));
 CLKBUF_X1 hold171 (.A(net238),
    .Z(net170));
 CLKBUF_X1 hold172 (.A(net240),
    .Z(net171));
 CLKBUF_X1 hold173 (.A(net250),
    .Z(net172));
 CLKBUF_X1 hold174 (.A(_005_),
    .Z(net173));
 CLKBUF_X1 hold175 (.A(net252),
    .Z(net174));
 CLKBUF_X1 hold176 (.A(_002_),
    .Z(net175));
 CLKBUF_X1 hold177 (.A(net251),
    .Z(net176));
 CLKBUF_X1 hold178 (.A(_007_),
    .Z(net177));
 CLKBUF_X1 hold179 (.A(net241),
    .Z(net178));
 CLKBUF_X1 hold180 (.A(net243),
    .Z(net179));
 CLKBUF_X1 hold181 (.A(net259),
    .Z(net180));
 CLKBUF_X1 hold182 (.A(net260),
    .Z(net181));
 CLKBUF_X1 hold183 (.A(net253),
    .Z(net182));
 CLKBUF_X1 hold184 (.A(net254),
    .Z(net183));
 CLKBUF_X1 hold185 (.A(net261),
    .Z(net184));
 CLKBUF_X1 hold186 (.A(_004_),
    .Z(net185));
 CLKBUF_X1 hold187 (.A(net244),
    .Z(net186));
 CLKBUF_X1 hold188 (.A(net246),
    .Z(net187));
 CLKBUF_X1 hold189 (.A(net247),
    .Z(net188));
 CLKBUF_X1 hold190 (.A(net249),
    .Z(net189));
 CLKBUF_X1 hold191 (.A(net257),
    .Z(net190));
 CLKBUF_X1 hold192 (.A(net258),
    .Z(net191));
 CLKBUF_X1 hold193 (.A(net262),
    .Z(net192));
 CLKBUF_X1 hold194 (.A(_025_),
    .Z(net193));
 CLKBUF_X1 hold195 (.A(net255),
    .Z(net194));
 CLKBUF_X1 hold196 (.A(net256),
    .Z(net195));
 CLKBUF_X1 hold197 (.A(net263),
    .Z(net196));
 CLKBUF_X1 hold198 (.A(_026_),
    .Z(net197));
 CLKBUF_X1 hold199 (.A(net265),
    .Z(net198));
 CLKBUF_X1 hold200 (.A(_009_),
    .Z(net199));
 CLKBUF_X1 hold201 (.A(net270),
    .Z(net200));
 CLKBUF_X1 hold202 (.A(_022_),
    .Z(net201));
 CLKBUF_X1 hold203 (.A(net264),
    .Z(net202));
 CLKBUF_X1 hold204 (.A(_018_),
    .Z(net203));
 CLKBUF_X1 hold205 (.A(net269),
    .Z(net204));
 CLKBUF_X1 hold206 (.A(_021_),
    .Z(net205));
 CLKBUF_X1 hold207 (.A(net157),
    .Z(net206));
 CLKBUF_X1 hold208 (.A(net237),
    .Z(net207));
 CLKBUF_X1 hold209 (.A(net268),
    .Z(net208));
 CLKBUF_X1 hold210 (.A(_010_),
    .Z(net209));
 CLKBUF_X1 hold211 (.A(net271),
    .Z(net210));
 CLKBUF_X1 hold212 (.A(_028_),
    .Z(net211));
 CLKBUF_X1 hold213 (.A(net267),
    .Z(net212));
 CLKBUF_X1 hold214 (.A(_024_),
    .Z(net213));
 CLKBUF_X1 hold215 (.A(net146),
    .Z(net214));
 CLKBUF_X1 hold216 (.A(_051_),
    .Z(net215));
 CLKBUF_X1 hold217 (.A(_008_),
    .Z(net216));
 CLKBUF_X1 hold218 (.A(net161),
    .Z(net217));
 CLKBUF_X1 hold219 (.A(_083_),
    .Z(net218));
 CLKBUF_X1 hold220 (.A(_023_),
    .Z(net219));
 CLKBUF_X1 hold221 (.A(net148),
    .Z(net220));
 CLKBUF_X1 hold222 (.A(_047_),
    .Z(net221));
 CLKBUF_X1 hold223 (.A(_006_),
    .Z(net222));
 CLKBUF_X1 hold224 (.A(net151),
    .Z(net223));
 CLKBUF_X1 hold225 (.A(_041_),
    .Z(net224));
 CLKBUF_X1 hold226 (.A(_003_),
    .Z(net225));
 CLKBUF_X1 hold227 (.A(net155),
    .Z(net226));
 CLKBUF_X1 hold228 (.A(_029_),
    .Z(net227));
 CLKBUF_X1 hold229 (.A(\IF_ID.pc_in[2] ),
    .Z(net228));
 CLKBUF_X1 hold230 (.A(net164),
    .Z(net229));
 CLKBUF_X1 hold231 (.A(_030_),
    .Z(net230));
 CLKBUF_X1 hold232 (.A(net154),
    .Z(net231));
 CLKBUF_X1 hold233 (.A(net166),
    .Z(net232));
 CLKBUF_X1 hold234 (.A(net143),
    .Z(net233));
 CLKBUF_X1 hold235 (.A(net168),
    .Z(net234));
 CLKBUF_X1 hold236 (.A(_011_),
    .Z(net235));
 CLKBUF_X1 hold237 (.A(net152),
    .Z(net236));
 CLKBUF_X1 hold238 (.A(_027_),
    .Z(net237));
 CLKBUF_X1 hold239 (.A(net142),
    .Z(net238));
 CLKBUF_X1 hold240 (.A(net170),
    .Z(net239));
 CLKBUF_X1 hold241 (.A(_012_),
    .Z(net240));
 CLKBUF_X1 hold242 (.A(net140),
    .Z(net241));
 CLKBUF_X1 hold243 (.A(net178),
    .Z(net242));
 CLKBUF_X1 hold244 (.A(_014_),
    .Z(net243));
 CLKBUF_X1 hold245 (.A(net138),
    .Z(net244));
 CLKBUF_X1 hold246 (.A(net186),
    .Z(net245));
 CLKBUF_X1 hold247 (.A(_016_),
    .Z(net246));
 CLKBUF_X1 hold248 (.A(net141),
    .Z(net247));
 CLKBUF_X1 hold249 (.A(net188),
    .Z(net248));
 CLKBUF_X1 hold250 (.A(_013_),
    .Z(net249));
 CLKBUF_X1 hold251 (.A(net273),
    .Z(net250));
 CLKBUF_X1 hold252 (.A(net276),
    .Z(net251));
 CLKBUF_X1 hold253 (.A(net275),
    .Z(net252));
 CLKBUF_X1 hold254 (.A(net135),
    .Z(net253));
 CLKBUF_X1 hold255 (.A(_019_),
    .Z(net254));
 CLKBUF_X1 hold256 (.A(net137),
    .Z(net255));
 CLKBUF_X1 hold257 (.A(_017_),
    .Z(net256));
 CLKBUF_X1 hold258 (.A(net139),
    .Z(net257));
 CLKBUF_X1 hold259 (.A(_015_),
    .Z(net258));
 CLKBUF_X1 hold260 (.A(net134),
    .Z(net259));
 CLKBUF_X1 hold261 (.A(_020_),
    .Z(net260));
 CLKBUF_X1 hold262 (.A(net150),
    .Z(net261));
 CLKBUF_X1 hold263 (.A(net159),
    .Z(net262));
 CLKBUF_X1 hold264 (.A(net158),
    .Z(net263));
 CLKBUF_X1 hold265 (.A(net136),
    .Z(net264));
 CLKBUF_X1 hold266 (.A(net145),
    .Z(net265));
 CLKBUF_X1 hold267 (.A(net155),
    .Z(net266));
 CLKBUF_X1 hold268 (.A(net160),
    .Z(net267));
 CLKBUF_X1 hold269 (.A(net144),
    .Z(net268));
 CLKBUF_X1 hold270 (.A(net133),
    .Z(net269));
 CLKBUF_X1 hold271 (.A(net132),
    .Z(net270));
 CLKBUF_X1 hold272 (.A(net156),
    .Z(net271));
 CLKBUF_X1 hold273 (.A(net152),
    .Z(net272));
 CLKBUF_X1 hold274 (.A(net149),
    .Z(net273));
 CLKBUF_X1 hold275 (.A(net160),
    .Z(net274));
 CLKBUF_X1 hold276 (.A(net153),
    .Z(net275));
 CLKBUF_X1 hold277 (.A(net147),
    .Z(net276));
 BUF_X1 input131 (.A(enable),
    .Z(net130));
 BUF_X1 input132 (.A(reset),
    .Z(net131));
 BUF_X1 output133 (.A(net132),
    .Z(debug_pc[10]));
 BUF_X1 output134 (.A(net133),
    .Z(debug_pc[11]));
 BUF_X1 output135 (.A(net134),
    .Z(debug_pc[12]));
 BUF_X1 output136 (.A(net135),
    .Z(debug_pc[13]));
 BUF_X1 output137 (.A(net136),
    .Z(debug_pc[14]));
 BUF_X1 output138 (.A(net137),
    .Z(debug_pc[15]));
 BUF_X1 output139 (.A(net138),
    .Z(debug_pc[16]));
 BUF_X1 output140 (.A(net139),
    .Z(debug_pc[17]));
 BUF_X1 output141 (.A(net140),
    .Z(debug_pc[18]));
 BUF_X1 output142 (.A(net141),
    .Z(debug_pc[19]));
 BUF_X1 output143 (.A(net142),
    .Z(debug_pc[20]));
 BUF_X1 output144 (.A(net143),
    .Z(debug_pc[21]));
 BUF_X1 output145 (.A(net144),
    .Z(debug_pc[22]));
 BUF_X1 output146 (.A(net145),
    .Z(debug_pc[23]));
 BUF_X1 output147 (.A(net146),
    .Z(debug_pc[24]));
 BUF_X1 output148 (.A(net147),
    .Z(debug_pc[25]));
 BUF_X1 output149 (.A(net148),
    .Z(debug_pc[26]));
 BUF_X1 output150 (.A(net149),
    .Z(debug_pc[27]));
 BUF_X1 output151 (.A(net150),
    .Z(debug_pc[28]));
 BUF_X1 output152 (.A(net151),
    .Z(debug_pc[29]));
 BUF_X1 output153 (.A(net152),
    .Z(debug_pc[2]));
 BUF_X1 output154 (.A(net153),
    .Z(debug_pc[30]));
 BUF_X1 output155 (.A(net154),
    .Z(debug_pc[31]));
 BUF_X1 output156 (.A(net155),
    .Z(debug_pc[3]));
 BUF_X1 output157 (.A(net156),
    .Z(debug_pc[4]));
 BUF_X1 output158 (.A(net157),
    .Z(debug_pc[5]));
 BUF_X1 output159 (.A(net158),
    .Z(debug_pc[6]));
 BUF_X1 output160 (.A(net159),
    .Z(debug_pc[7]));
 BUF_X1 output161 (.A(net160),
    .Z(debug_pc[8]));
 BUF_X1 output162 (.A(net161),
    .Z(debug_pc[9]));
 BUF_X1 place164 (.A(_001_),
    .Z(net163));
endmodule
