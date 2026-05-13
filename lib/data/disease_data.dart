// lib/data/disease_data.dart
// 25 disease classes with causes, symptoms, treatments & prevention

class DiseaseInfo {
  final String id;
  final String name;
  final String crop;
  final bool isHealthy;
  final String type; // Fungal / Bacterial / Viral / Pest / Nutrient
  final String cause;
  final List<String> symptoms;
  final List<String> treatment;
  final List<String> prevention;
  final String severity; // Low / Medium / High

  const DiseaseInfo({
    required this.id,
    required this.name,
    required this.crop,
    required this.isHealthy,
    required this.type,
    required this.cause,
    required this.symptoms,
    required this.treatment,
    required this.prevention,
    required this.severity,
  });
}

class DiseaseDatabase {
  static const Map<String, DiseaseInfo> diseases = {
    // ─────────────────────────────────────────
    // CORN
    // ─────────────────────────────────────────
    'corn_blight': DiseaseInfo(
      id: 'corn_blight',
      name: 'Corn Northern Leaf Blight',
      crop: 'Corn',
      isHealthy: false,
      type: 'Fungal',
      cause:
          'Caused by the fungus Exserohilum turcicum. Spreads via airborne spores, favoured by cool, humid conditions.',
      symptoms: [
        'Long, elliptical gray-green lesions on leaves',
        'Lesions turn tan/brown as they mature',
        'Lesions 2.5–15 cm in length',
        'Premature death of leaves in severe cases',
        'Significant yield loss if infection occurs before tasseling',
      ],
      treatment: [
        'Apply Mancozeb 75% WP at 2.5 kg/ha',
        'Use Propiconazole 25% EC at 0.1% concentration',
        'Apply Azoxystrobin fungicide as foliar spray',
        'Spray in early morning or late evening',
        'Repeat application every 10–14 days if needed',
      ],
      prevention: [
        'Plant resistant corn hybrids',
        'Practice crop rotation with non-host crops',
        'Remove and destroy infected crop debris',
        'Avoid overhead irrigation',
        'Ensure proper plant spacing for airflow',
      ],
      severity: 'High',
    ),

    'corn_common_rust': DiseaseInfo(
      id: 'corn_common_rust',
      name: 'Corn Common Rust',
      crop: 'Corn',
      isHealthy: false,
      type: 'Fungal',
      cause:
          'Caused by Puccinia sorghi. Spreads rapidly via wind-borne urediniospores in cool, moist weather.',
      symptoms: [
        'Small, circular to elongated golden-brown pustules on both leaf surfaces',
        'Pustules rupture releasing powdery rust-colored spores',
        'Leaves turn yellow then brown when heavily infected',
        'Premature leaf death in severe cases',
        'Husks and stalks may also be affected',
      ],
      treatment: [
        'Apply Mancozeb 75% WP at 2 kg/ha',
        'Use Tebuconazole 25.9% EC at 1 ml/L water',
        'Apply Chlorothalonil 500 g/acre as foliar spray',
        'Spray fungicide at first sign of pustules',
        'Repeat every 7–10 days during high-risk periods',
      ],
      prevention: [
        'Plant rust-resistant hybrid varieties',
        'Early planting to avoid peak spore periods',
        'Monitor fields regularly from silking stage',
        'Avoid dense planting — maintain good air circulation',
        'Destroy volunteer corn plants nearby',
      ],
      severity: 'Medium',
    ),

    'corn_gray_leaf_spot': DiseaseInfo(
      id: 'corn_gray_leaf_spot',
      name: 'Corn Gray Leaf Spot',
      crop: 'Corn',
      isHealthy: false,
      type: 'Fungal',
      cause:
          'Caused by Cercospora zeae-maydis. Favoured by high humidity, warm temperatures, and poor airflow.',
      symptoms: [
        'Rectangular, tan to gray lesions parallel to leaf veins',
        'Lesions are narrow (3–4 mm) and long (5–70 mm)',
        'Yellow halo may surround lesions',
        'Lesions may coalesce, killing entire leaves',
        'Lower leaves affected first, progressing upward',
      ],
      treatment: [
        'Apply Azoxystrobin + Propiconazole mixture',
        'Use Pyraclostrobin 20% WG at recommended dose',
        'Apply Trifloxystrobin fungicide as foliar spray',
        'Start spraying at or before silking stage',
        'Ensure thorough coverage of upper and lower leaf surfaces',
      ],
      prevention: [
        'Plant gray leaf spot–resistant hybrids',
        'Rotate corn with soybean or wheat',
        'Reduce tillage that buries infected residue',
        'Improve field drainage to reduce humidity',
        'Avoid planting in low-lying, poorly drained fields',
      ],
      severity: 'High',
    ),

    'corn_healthy': DiseaseInfo(
      id: 'corn_healthy',
      name: 'Healthy Corn',
      crop: 'Corn',
      isHealthy: true,
      type: 'None',
      cause: 'No disease detected.',
      symptoms: [
        'Vibrant green leaves with no lesions',
        'Normal leaf texture and color',
        'No pustules, spots, or discoloration',
      ],
      treatment: ['No treatment needed.'],
      prevention: [
        'Continue regular field monitoring',
        'Maintain proper fertilization schedule',
        'Ensure adequate irrigation',
        'Practice crop rotation annually',
      ],
      severity: 'None',
    ),

    // ─────────────────────────────────────────
    // TOMATO
    // ─────────────────────────────────────────
    'tomato_bacterial_spot': DiseaseInfo(
      id: 'tomato_bacterial_spot',
      name: 'Tomato Bacterial Spot',
      crop: 'Tomato',
      isHealthy: false,
      type: 'Bacterial',
      cause:
          'Caused by Xanthomonas vesicatoria. Spreads via infected seed, rain splash, and contaminated tools.',
      symptoms: [
        'Small, water-soaked spots on leaves that turn brown',
        'Spots surrounded by yellow halo',
        'Lesions may appear on stems and fruits',
        'Defoliation in severe cases',
        'Fruit spots are raised, rough, and scab-like',
      ],
      treatment: [
        'Apply Copper Oxychloride 50% WP at 3 g/L',
        'Use Streptomycin Sulphate 90% SP at 200 ppm',
        'Apply Copper Hydroxide as preventive spray',
        'Remove and destroy heavily infected plant parts',
        'Repeat spray every 7–10 days',
      ],
      prevention: [
        'Use certified disease-free seeds',
        'Avoid overhead irrigation — use drip instead',
        'Disinfect tools with 10% bleach solution',
        'Rotate tomatoes with non-solanaceous crops',
        'Remove crop debris after harvest',
      ],
      severity: 'High',
    ),

    'tomato_early_blight': DiseaseInfo(
      id: 'tomato_early_blight',
      name: 'Tomato Early Blight',
      crop: 'Tomato',
      isHealthy: false,
      type: 'Fungal',
      cause:
          'Caused by Alternaria solani. Favoured by warm, humid conditions; survives in soil and plant debris.',
      symptoms: [
        'Dark brown spots with concentric rings (target-board pattern)',
        'Yellow halo around spots',
        'Lower leaves affected first',
        'Severe defoliation reduces fruit yield',
        'Dark, sunken lesions on stems and fruits',
      ],
      treatment: [
        'Apply Mancozeb 75% WP at 2.5 g/L water',
        'Use Chlorothalonil 75% WP at 2 g/L',
        'Apply Iprodione fungicide at first symptom',
        'Spray early morning before temperatures peak',
        'Repeat every 7–10 days during wet weather',
      ],
      prevention: [
        'Use disease-resistant tomato varieties',
        'Maintain proper plant spacing (60 cm apart)',
        'Mulch around plants to prevent soil splash',
        'Remove lower infected leaves promptly',
        'Avoid wetting foliage during irrigation',
      ],
      severity: 'Medium',
    ),

    'tomato_late_blight': DiseaseInfo(
      id: 'tomato_late_blight',
      name: 'Tomato Late Blight',
      crop: 'Tomato',
      isHealthy: false,
      type: 'Fungal',
      cause:
          'Caused by Phytophthora infestans. Spreads rapidly in cool, wet weather via wind-borne sporangia.',
      symptoms: [
        'Pale green to dark brown water-soaked lesions on leaves',
        'White fuzzy mold on undersides of leaves in humid conditions',
        'Rapid browning and collapse of infected tissue',
        'Dark greasy spots on fruits',
        'Can destroy entire crop within days if untreated',
      ],
      treatment: [
        'Apply Metalaxyl + Mancozeb (Ridomil Gold) at 2.5 g/L',
        'Use Cymoxanil 8% + Mancozeb 64% WP at 3 g/L',
        'Apply Dimethomorph as systemic fungicide',
        'Spray immediately at first sign of infection',
        'Repeat every 5–7 days during wet season',
      ],
      prevention: [
        'Use certified late-blight resistant varieties',
        'Avoid planting in low, poorly drained areas',
        'Apply preventive copper-based sprays',
        'Destroy infected plants immediately — do not compost',
        'Monitor weather forecasts — spray before rain',
      ],
      severity: 'High',
    ),

    'tomato_leaf_mold': DiseaseInfo(
      id: 'tomato_leaf_mold',
      name: 'Tomato Leaf Mold',
      crop: 'Tomato',
      isHealthy: false,
      type: 'Fungal',
      cause:
          'Caused by Passalora fulva (syn. Fulvia fulva). Thrives in high humidity (>85%) and moderate temperatures.',
      symptoms: [
        'Pale green or yellow spots on upper leaf surface',
        'Olive-green to brown velvety mold on lower leaf surface',
        'Infected leaves curl, wither, and drop',
        'Fruits rarely affected but quality reduced',
        'Severe defoliation in greenhouse crops',
      ],
      treatment: [
        'Apply Chlorothalonil 75% WP at 2 g/L',
        'Use Mancozeb 75% WP + Carbendazim mixture',
        'Apply Trifloxystrobin fungicide as foliar spray',
        'Improve ventilation in greenhouse settings',
        'Repeat spray every 10 days',
      ],
      prevention: [
        'Maintain relative humidity below 85%',
        'Ensure good airflow between plants',
        'Use resistant tomato varieties (Cf genes)',
        'Remove and destroy infected leaves',
        'Avoid excessive nitrogen fertilization',
      ],
      severity: 'Medium',
    ),

    'tomato_septoria_leaf_spot': DiseaseInfo(
      id: 'tomato_septoria_leaf_spot',
      name: 'Tomato Septoria Leaf Spot',
      crop: 'Tomato',
      isHealthy: false,
      type: 'Fungal',
      cause:
          'Caused by Septoria lycopersici. Spreads via rain splash; survives in infected crop debris and weeds.',
      symptoms: [
        'Small, circular spots (3–6 mm) with dark borders and gray centers',
        'Tiny black dots (pycnidia) visible in center of spots',
        'Lower leaves infected first, progressing upward',
        'Heavy defoliation weakens plant significantly',
        'Fruits not directly infected but yield reduced',
      ],
      treatment: [
        'Apply Mancozeb 75% WP at 2.5 g/L',
        'Use Chlorothalonil 500 SC at 1.5 ml/L',
        'Apply Copper Oxychloride as protective spray',
        'Remove infected lower leaves before spraying',
        'Repeat every 10–14 days',
      ],
      prevention: [
        'Use disease-free certified transplants',
        'Mulch to reduce soil splash on leaves',
        'Avoid working in field when plants are wet',
        'Rotate with non-solanaceous crops for 2 years',
        'Weed management — remove solanaceous weeds',
      ],
      severity: 'Medium',
    ),

    'tomato_spider_mites': DiseaseInfo(
      id: 'tomato_spider_mites',
      name: 'Tomato Spider Mites',
      crop: 'Tomato',
      isHealthy: false,
      type: 'Pest',
      cause:
          'Caused by Tetranychus urticae (Two-spotted spider mite). Thrives in hot, dry conditions.',
      symptoms: [
        'Tiny yellow or white stippling/speckling on leaves',
        'Fine webbing on undersides of leaves',
        'Leaves turn bronze, yellow, and eventually dry up',
        'Premature defoliation in severe infestations',
        'Mites visible as tiny moving dots with magnification',
      ],
      treatment: [
        'Apply Abamectin 1.8% EC at 0.5 ml/L water',
        'Use Spiromesifen 22.9% SC at 0.9 ml/L',
        'Apply Neem oil (Azadirachtin) at 5 ml/L',
        'Spray undersides of leaves thoroughly',
        'Rotate miticides to prevent resistance',
      ],
      prevention: [
        'Maintain adequate soil moisture — mites prefer dry conditions',
        'Introduce predatory mites (Phytoseiidae) as biocontrol',
        'Remove heavily infested leaves early',
        'Avoid excessive nitrogen fertilization',
        'Inspect transplants before field planting',
      ],
      severity: 'Medium',
    ),

    'tomato_target_spot': DiseaseInfo(
      id: 'tomato_target_spot',
      name: 'Tomato Target Spot',
      crop: 'Tomato',
      isHealthy: false,
      type: 'Fungal',
      cause:
          'Caused by Corynespora cassiicola. Favoured by warm, humid conditions and poor air circulation.',
      symptoms: [
        'Circular brown spots with concentric rings (target-like)',
        'Spots have yellow halo on older leaves',
        'Lesions on stems appear as dark elongated streaks',
        'Fruit lesions are sunken, brown, and water-soaked',
        'Severe defoliation reduces fruit quality and yield',
      ],
      treatment: [
        'Apply Azoxystrobin 23% SC at 1 ml/L',
        'Use Difenoconazole 25% EC at 0.5 ml/L',
        'Apply Mancozeb 75% WP as protective spray',
        'Start spraying from transplanting stage',
        'Repeat every 10–14 days',
      ],
      prevention: [
        'Use resistant varieties where available',
        'Maintain plant spacing for air circulation',
        'Avoid overhead irrigation',
        'Remove lower infected leaves regularly',
        'Crop rotation with non-host plants',
      ],
      severity: 'Medium',
    ),

    'tomato_yellow_leaf_curl_virus': DiseaseInfo(
      id: 'tomato_yellow_leaf_curl_virus',
      name: 'Tomato Yellow Leaf Curl Virus',
      crop: 'Tomato',
      isHealthy: false,
      type: 'Viral',
      cause:
          'Caused by TYLCV (Begomovirus). Transmitted exclusively by whitefly (Bemisia tabaci). No plant-to-plant spread.',
      symptoms: [
        'Upward curling and yellowing of leaf margins',
        'Leaves become small, thick, and leathery',
        'Interveinal yellowing (chlorosis)',
        'Stunted plant growth',
        'Severe flower drop — very low fruit set',
      ],
      treatment: [
        'No cure once infected — remove and destroy affected plants',
        'Control whitefly vector with Imidacloprid 17.8% SL at 0.5 ml/L',
        'Use Thiamethoxam 25% WG at 0.4 g/L for whitefly control',
        'Apply yellow sticky traps to monitor whitefly',
        'Use reflective silver mulch to repel whiteflies',
      ],
      prevention: [
        'Plant TYLCV-resistant tomato varieties',
        'Use whitefly-proof insect nets in nursery',
        'Remove and burn infected plants immediately',
        'Avoid planting near old infected fields',
        'Control weeds that host whiteflies',
      ],
      severity: 'High',
    ),

    'tomato_mosaic_virus': DiseaseInfo(
      id: 'tomato_mosaic_virus',
      name: 'Tomato Mosaic Virus',
      crop: 'Tomato',
      isHealthy: false,
      type: 'Viral',
      cause:
          'Caused by Tomato mosaic virus (ToMV). Spreads via mechanical contact, infected seed, and contaminated hands/tools.',
      symptoms: [
        'Light and dark green mosaic pattern on leaves',
        'Leaf distortion, curling, and fern-like appearance',
        'Stunted growth and reduced plant vigor',
        'Fruit may show uneven ripening or internal browning',
        'Necrotic streaks on stems in severe cases',
      ],
      treatment: [
        'No effective chemical cure once infected',
        'Remove and destroy infected plants promptly',
        'Disinfect tools with 10% trisodium phosphate (TSP)',
        'Wash hands thoroughly before handling plants',
        'Apply milk spray (10% skim milk) as mild preventive',
      ],
      prevention: [
        'Use ToMV-resistant tomato varieties',
        'Treat seeds with trisodium phosphate before planting',
        'Avoid tobacco use near tomato plants (cross-infection)',
        'Control aphid vectors with appropriate insecticides',
        'Never work in wet fields — virus spreads faster',
      ],
      severity: 'High',
    ),

    'tomato_healthy': DiseaseInfo(
      id: 'tomato_healthy',
      name: 'Healthy Tomato',
      crop: 'Tomato',
      isHealthy: true,
      type: 'None',
      cause: 'No disease detected.',
      symptoms: [
        'Deep green, firm leaves with no spots or discoloration',
        'Normal leaf texture and shape',
        'No pests, mold, or abnormal growth visible',
      ],
      treatment: ['No treatment needed.'],
      prevention: [
        'Continue weekly field scouting',
        'Maintain balanced fertilization (NPK)',
        'Monitor for early pest and disease signs',
        'Keep irrigation consistent — avoid water stress',
      ],
      severity: 'None',
    ),

    'tomato_powdery_mildew': DiseaseInfo(
      id: 'tomato_powdery_mildew',
      name: 'Tomato Powdery Mildew',
      crop: 'Tomato',
      isHealthy: false,
      type: 'Fungal',
      cause:
          'Caused by Oidium neolycopersici. Unlike most fungi, thrives in warm dry conditions with low humidity.',
      symptoms: [
        'White powdery fungal growth on upper leaf surface',
        'Yellow patches on leaves below the white growth',
        'Infected leaves curl, dry out, and drop',
        'Reduced photosynthesis and plant vigor',
        'Rarely affects fruit but weakens entire plant',
      ],
      treatment: [
        'Apply Sulphur 80% WP at 3 g/L water',
        'Use Hexaconazole 5% EC at 2 ml/L',
        'Apply Potassium bicarbonate at 5 g/L as organic option',
        'Spray both sides of leaves thoroughly',
        'Repeat every 7–10 days',
      ],
      prevention: [
        'Plant resistant tomato varieties',
        'Avoid excessive nitrogen fertilization',
        'Ensure good sunlight penetration and airflow',
        'Remove and destroy infected leaves early',
        'Apply preventive sulphur spray during dry spells',
      ],
      severity: 'Medium',
    ),

    // ─────────────────────────────────────────
    // RICE
    // ─────────────────────────────────────────
    'rice_bacterial_leaf_blight': DiseaseInfo(
      id: 'rice_bacterial_leaf_blight',
      name: 'Rice Bacterial Leaf Blight',
      crop: 'Rice',
      isHealthy: false,
      type: 'Bacterial',
      cause:
          'Caused by Xanthomonas oryzae pv. oryzae. Enters through leaf margins and hydathodes; spreads via water.',
      symptoms: [
        'Water-soaked lesions beginning at leaf tips or margins',
        'Lesions turn yellow then straw-white as they expand',
        'Milky or opaque bacterial exudate on lesions in morning',
        'Leaves roll and wilt — "kresek" symptom in seedlings',
        'Entire tillers may die in severe infections',
      ],
      treatment: [
        'Apply Copper Oxychloride 50% WP at 3 g/L',
        'Use Streptomycin Sulphate 90% SP at 500 ppm',
        'Apply Bismerthiazol 20% WP as foliar spray',
        'Drain fields and reduce nitrogen application',
        'Repeat spray every 10 days during outbreak',
      ],
      prevention: [
        'Plant resistant rice varieties (IR64, Swarna Sub1)',
        'Avoid excessive nitrogen fertilization',
        'Use clean, disease-free seed',
        'Drain fields to reduce water-borne spread',
        'Avoid introducing flood water from infected fields',
      ],
      severity: 'High',
    ),

    'rice_brown_spot': DiseaseInfo(
      id: 'rice_brown_spot',
      name: 'Rice Brown Spot',
      crop: 'Rice',
      isHealthy: false,
      type: 'Fungal',
      cause:
          'Caused by Cochliobolus miyabeanus. Associated with nutrient-deficient soils, especially potassium deficiency.',
      symptoms: [
        'Small, circular to oval brown spots with gray center',
        'Spots have yellow halo on older lesions',
        'Severely infected leaves dry up and die',
        'Brown discoloration of grain (pecky rice)',
        'Seedling blight in nurseries (leaf scorch)',
      ],
      treatment: [
        'Apply Mancozeb 75% WP at 2.5 g/L',
        'Use Iprodione 50% WP at 1.5 g/L',
        'Apply Propiconazole 25% EC at 1 ml/L',
        'Correct soil nutrient deficiency — apply potassium',
        'Spray at tillering and panicle initiation stages',
      ],
      prevention: [
        'Correct soil nutrient deficiencies before planting',
        'Use silicon-rich soil amendments',
        'Plant resistant varieties',
        'Use disease-free certified seed',
        'Proper water management throughout crop cycle',
      ],
      severity: 'Medium',
    ),

    'rice_healthy': DiseaseInfo(
      id: 'rice_healthy',
      name: 'Healthy Rice',
      crop: 'Rice',
      isHealthy: true,
      type: 'None',
      cause: 'No disease detected.',
      symptoms: [
        'Bright green, erect leaves with no lesions',
        'Normal plant height and tillering',
        'No discoloration, spots, or abnormalities',
      ],
      treatment: ['No treatment needed.'],
      prevention: [
        'Maintain proper water levels in paddy field',
        'Apply balanced NPK fertilizer per schedule',
        'Scout regularly for insect pests and diseases',
        'Ensure clean irrigation water supply',
      ],
      severity: 'None',
    ),

    'rice_leaf_blast': DiseaseInfo(
      id: 'rice_leaf_blast',
      name: 'Rice Leaf Blast',
      crop: 'Rice',
      isHealthy: false,
      type: 'Fungal',
      cause:
          'Caused by Magnaporthe oryzae. Most destructive rice disease worldwide; spreads via airborne conidia.',
      symptoms: [
        'Diamond-shaped lesions with gray center and brown border',
        'Lesions have yellow halo on susceptible varieties',
        'Severe infection causes entire leaf to die (ragi blast)',
        'Neck blast — panicle base turns gray, grain unfilled',
        'Can cause up to 100% yield loss in epidemic years',
      ],
      treatment: [
        'Apply Tricyclazole 75% WP at 0.6 g/L — most effective',
        'Use Isoprothiolane 40% EC at 1.5 ml/L',
        'Apply Azoxystrobin 23% SC at 1 ml/L',
        'Spray at tillering and heading stage immediately',
        'Repeat every 10–14 days during outbreaks',
      ],
      prevention: [
        'Plant blast-resistant varieties (Pusa Basmati 1)',
        'Avoid excessive nitrogen — promotes susceptibility',
        'Drain water periodically to reduce humidity',
        'Treat seed with Carbendazim 50% WP before sowing',
        'Avoid late planting when cool nights favor blast',
      ],
      severity: 'High',
    ),

    'rice_leaf_scald': DiseaseInfo(
      id: 'rice_leaf_scald',
      name: 'Rice Leaf Scald',
      crop: 'Rice',
      isHealthy: false,
      type: 'Fungal',
      cause:
          'Caused by Monographella albescens. Occurs in humid tropical conditions, especially on mature leaves.',
      symptoms: [
        'Lesions begin at leaf tips — tan with brown wavy border',
        'Characteristic "zonate" or banded pattern on lesions',
        'Lesions expand downward killing large leaf areas',
        'Sheaths may also be affected with similar symptoms',
        'Can be confused with bacterial leaf blight',
      ],
      treatment: [
        'Apply Propiconazole 25% EC at 1 ml/L',
        'Use Mancozeb 75% WP at 2.5 g/L as protectant',
        'Apply Hexaconazole 5% EC at 2 ml/L',
        'Spray during active crop growth stages',
        'Repeat every 14 days if disease persists',
      ],
      prevention: [
        'Use tolerant or resistant rice varieties',
        'Apply balanced potassium fertilization',
        'Avoid high plant density — reduce humidity',
        'Remove infected stubble after harvest',
        'Improve field drainage to reduce leaf wetness',
      ],
      severity: 'Medium',
    ),

    'rice_sheath_blight': DiseaseInfo(
      id: 'rice_sheath_blight',
      name: 'Rice Sheath Blight',
      crop: 'Rice',
      isHealthy: false,
      type: 'Fungal',
      cause:
          'Caused by Rhizoctonia solani. Spreads via sclerotia floating in irrigation water and infected debris.',
      symptoms: [
        'Oval or irregular water-soaked lesions on leaf sheath',
        'Lesions have grayish-white center with dark brown border',
        'Lesions progress from lower sheath upward to leaves',
        'Plants lodge (fall over) in severe infections',
        'Floating tan-colored sclerotia visible in water',
      ],
      treatment: [
        'Apply Hexaconazole 5% EC at 2 ml/L',
        'Use Propiconazole 25% EC at 1 ml/L',
        'Apply Validamycin 3% L at 2 ml/L — highly effective',
        'Spray at base of plants where sheath is infected',
        'Repeat every 10–14 days',
      ],
      prevention: [
        'Reduce plant density — avoid transplanting too close',
        'Apply silicon fertilizer to strengthen cell walls',
        'Drain field periodically to remove sclerotia',
        'Avoid excess nitrogen which promotes dense canopy',
        'Use Trichoderma-based biocontrol agents at planting',
      ],
      severity: 'High',
    ),

    // ─────────────────────────────────────────
    // COCONUT
    // ─────────────────────────────────────────
    'coconut_healthy': DiseaseInfo(
      id: 'coconut_healthy',
      name: 'Healthy Coconut',
      crop: 'Coconut',
      isHealthy: true,
      type: 'None',
      cause: 'No disease detected.',
      symptoms: [
        'Long, bright green fronds with no discoloration',
        'Normal frond count and growth rate',
        'No lesions, spots, yellowing, or wilting',
      ],
      treatment: ['No treatment needed.'],
      prevention: [
        'Apply coconut-specific NPK fertilizer annually',
        'Monitor for rhinoceros beetle and red palm weevil',
        'Irrigate during dry spells (40–50 L/palm/day)',
        'Keep basin clean of weeds and debris',
      ],
      severity: 'None',
    ),

    'coconut_pest_damage': DiseaseInfo(
      id: 'coconut_pest_damage',
      name: 'Coconut Pest Damage',
      crop: 'Coconut',
      isHealthy: false,
      type: 'Pest',
      cause:
          'Caused by Rhinoceros beetle (Oryctes rhinoceros), Red Palm Weevil (Rhynchophorus ferrugineus), or Coconut mite (Aceria guerreronis).',
      symptoms: [
        'V-shaped cuts on fronds (Rhinoceros beetle damage)',
        'Wilting and collapse of crown (Red Palm Weevil)',
        'Premature nut fall and malformed fruits',
        'Tunneling damage visible in trunk or spear',
        'Fermented odor from trunk indicates weevil infestation',
      ],
      treatment: [
        'Apply Imidacloprid 17.8% SL (5 ml/palm trunk injection)',
        'Set up pheromone traps for Red Palm Weevil monitoring',
        'Apply Carbaryl 50% WP + sand mixture in crown for beetle',
        'Remove and destroy infested palms to prevent spread',
        'Use Metarhizium anisopliae biopesticide in soil',
      ],
      prevention: [
        'Remove dead palms and rotting wood (beetle breeding sites)',
        'Maintain pheromone traps (1 per 10 palms)',
        'Avoid wounding trunk during agricultural operations',
        'Regular crown inspection every 2–3 months',
        'Apply Neem cake at palm base to deter pests',
      ],
      severity: 'High',
    ),

    'coconut_yellowing': DiseaseInfo(
      id: 'coconut_yellowing',
      name: 'Coconut Yellowing',
      crop: 'Coconut',
      isHealthy: false,
      type: 'Bacterial',
      cause:
          'Caused by phytoplasma (Coconut Lethal Yellowing). Transmitted by planthopper Myndus crudus. Also related to nutrient deficiencies.',
      symptoms: [
        'Premature yellowing of outer fronds progressing inward',
        'Premature nut drop (unripe nuts fall)',
        'Flowers turn black and die (inflorescence necrosis)',
        'Spear leaf yellows and collapses — tree death follows',
        'Entire palm dies within 3–6 months of infection',
      ],
      treatment: [
        'Inject Oxytetracycline HCl 500 mg into trunk (antibiotic treatment)',
        'Apply 4 trunk injections per year for phytoplasma control',
        'Remove and destroy infected palms immediately',
        'Apply balanced micronutrient fertilizer if nutrient-related',
        'No complete cure — antibiotic only delays progression',
      ],
      prevention: [
        'Plant resistant varieties (Maypan hybrid)',
        'Control planthopper vector with Imidacloprid',
        'Remove infected palms before disease spreads',
        'Avoid planting near known infected areas',
        'Annual foliar micronutrient spray (Mn, Mg, B)',
      ],
      severity: 'High',
    ),

    'coconut_leaf_spot': DiseaseInfo(
      id: 'coconut_leaf_spot',
      name: 'Coconut Leaf Spot',
      crop: 'Coconut',
      isHealthy: false,
      type: 'Fungal',
      cause:
          'Caused by Pestalotiopsis palmarum or Helminthosporium sp. Favoured by humid conditions and poor nutrition.',
      symptoms: [
        'Small, yellow to brown oval spots on leaflets',
        'Spots enlarge with grayish center and dark brown border',
        'Numerous spots may coalesce, killing entire leaflets',
        'Premature yellowing and death of older fronds',
        'Reduced photosynthesis affecting nut yield',
      ],
      treatment: [
        'Apply Copper Oxychloride 50% WP at 3 g/L',
        'Use Mancozeb 75% WP at 2.5 g/L',
        'Apply Propiconazole 25% EC at 1 ml/L as foliar spray',
        'Remove severely infected fronds before spraying',
        'Repeat spray 2–3 times at 21-day intervals',
      ],
      prevention: [
        'Apply balanced NPK + micronutrient fertilizer',
        'Remove infected fronds and burn them',
        'Avoid water stress — maintain regular irrigation',
        'Apply organic mulch around palm base',
        'Improve drainage in waterlogged areas',
      ],
      severity: 'Medium',
    ),
  };

  static DiseaseInfo? getDisease(String id) => diseases[id];

  static List<DiseaseInfo> getByClop(String crop) =>
      diseases.values.where((d) => d.crop == crop).toList();

  static const List<String> classLabels = [
    'corn_blight',
    'corn_common_rust',
    'corn_gray_leaf_spot',
    'corn_healthy',
    'tomato_bacterial_spot',
    'tomato_early_blight',
    'tomato_late_blight',
    'tomato_leaf_mold',
    'tomato_septoria_leaf_spot',
    'tomato_spider_mites',
    'tomato_target_spot',
    'tomato_yellow_leaf_curl_virus',
    'tomato_mosaic_virus',
    'tomato_healthy',
    'tomato_powdery_mildew',
    'rice_bacterial_leaf_blight',
    'rice_brown_spot',
    'rice_healthy',
    'rice_leaf_blast',
    'rice_leaf_scald',
    'rice_sheath_blight',
    'coconut_healthy',
    'coconut_pest_damage',
    'coconut_yellowing',
    'coconut_leaf_spot',
  ];
}
