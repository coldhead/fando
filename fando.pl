#!/usr/bin/env perl
use strict;
use warnings;
use utf8;

# ---------------------------------------------------------
# 1. THE NAMES ARRAY
# Simply add, remove, or edit names here. 
# Accents/Diacritics (like ë or ü) are perfectly fine.
# ---------------------------------------------------------
my @names = (
    # A
    "Abas", "Achelous", "Achilles", "Acis", "Acoetes", "Actaeon", "Adonis", 
    "Aeacus", "Aeetes", "Aegeus", "Aeneas", "Aeolus", "Aesculapius", "Aeson", 
    "Agamemnon", "Agauë", "Aglauros", "Ajax", "Alcithoë", "Alcyone", "Althaea", 
    "Ammon", "Amymone", "Anaxarete", "Andromeda", "Anius", "Antigone", "Apollo", 
    "Arachne", "Arcas", "Arethusa", "Argus", "Ariadne", "Ascalaphus", "Asopus", 
    "Astraea", "Athamas", "Atlas", "Aurora", "Autolycus",
    # B
    "Bacchus", "Battus", "Baucis", "Boreas", "Byblis",
    # C
    "Cadmus", "Caeneus", "Calais", "Callisto", "Calydon", "Canens", "Cassiope", 
    "Caunus", "Cebriones", "Cecrops", "Cephissus", "Cephalus", "Ceres", "Ceyx", 
    "Chiron", "Chione", "Cinyras", "Clymene", "Clytie", "Cometes", "Coronis", 
    "Crataeis", "Creusa", "Crotopus", "Cupido", "Cyane", "Cybele", "Cygnus", 
    "Cyllene", "Cyparissus",
    # D
    "Daedalion", "Daedalus", "Danaë", "Daphne", "Deianira", "Deioneus", 
    "Deiphobus", "Deucalion", "Diana", "Dictys", "Diomedes", "Dione", "Dryope",
    # E
    "Echo", "Egeria", "Elpenor", "Enceladus", "Epaphus", "Erechtheus", 
    "Erisichthon", "Eryx", "Eumolpus", "Europa", "Eurus", "Euryalus", "Eurydice", 
    "Eurystheus", "Eurytus",
    # F
    "Faunus",
    # G
    "Galanthis", "Galatea", "Ganymedes", "Geryon", "Glaucus", "Gorgon", "Graecus",
    # H
    "Haemon", "Haemus", "Harmonia", "Hecate", "Hecuba", "Helena", "Heliades", 
    "Helicon", "Hercules", "Hermaphroditus", "Hermes", "Hersilia", "Hesperia", 
    "Hippodamia", "Hippolytus", "Hippomenes", "Hyacinthus", "Hylas", "Hyllus",
    # I
    "Iachus", "Ianthe", "Iapetus", "Iason", "Icarus", "Inachus", "Ino", "Io", 
    "Iole", "Iphigenia", "Iphis", "Iris", "Itys", "Ixion",
    # J
    "Janus", "Jove", "Juno", "Jupiter",
    # L
    "Ladon", "Laertes", "Laelaps", "Latona", "Lelex", "Leucothoë", "Liriope", 
    "Lycabant", "Lycaon", "Lyciscus", "Lyncus", "Liriope",
    # M
    "Macareus", "Machaon", "Maeander", "Maia", "Mars", "Marsyas", "Medea", 
    "Medusa", "Meleager", "Memnon", "Mercurius", "Meryon", "Midas", "Minerva", 
    "Minos", "Minotaurus", "Mnemosyne", "Morpheus", "Mulciber", "Myrrha",
    # N
    "Naiades", "Narcissus", "Neleus", "Nemesis", "Neptunus", "Nessus", "Nestor", 
    "Niobe", "Numitor", "Nyctimene", "Nymphae",
    # O
    "Ocyrhoe", "Oedipus", "Oeneus", "Oeta", "Olympus", "Orithyia", "Orpheus", "Osiris",
    # P
    "Palaemon", "Palamedes", "Pales", "Palinurus", "Pallas", "Pan", "Pandion", 
    "Peleus", "Pelias", "Pelops", "Penates", "Penelope", "Peneus", "Pentheus", 
    "Pergama", "Periclymenus", "Persephone", "Perseus", "Phaedimus", "Phaëthon", 
    "Philemon", "Philoctetes", "Philomela", "Phineus", "Phocus", "Phoebe", 
    "Phoebus", "Picnus", "Picus", "Pierides", "Pirithous", "Pluto", "Polydorus", 
    "Polymestor", "Polxena", "Pomona", "Priamus", "Procne", "Procris", "Proetides", 
    "Proetus", "Prometheus", "Proserpina", "Proteus", "Pygmalion", "Pyramus", 
    "Pyreneus", "Pyrrha", "Python",
    # Q
    "Quirinus",
    # R
    "Rhadamanthus", "Rhesus", "Rhea", "Romulus", "Rutuli",
    # S
    "Salmacis", "Saturnus", "Scylla", "Semele", "Sibylla", "Silenus", "Sirenes", 
    "Sisyphus", "Somnus", "Styx", "Syrinx",
    # T
    "Tages", "Talaus", "Tantalus", "Tarpeia", "Tatius", "Telamon", "Telemachus", 
    "Telethusa", "Tereus", "Tethys", "Teucer", "Thaumas", "Themis", "Theridamas", 
    "Thersites", "Theseus", "Thisbe", "Thoas", "Thracia", "Thyestes", "Tiresias", 
    "Tisiphone", "Tithonus", "Tityus", "Tmolus", "Triptolemus", "Triton", "Troia", 
    "Turnus", "Typhoeus",
    # U
    "Ulysses", "Urania",
    # V
    "Venus", "Vertumnus", "Vesta", "Vulcanus",
    # X
    "Xanthus",
    # Z
    "Zancle", "Zethus", "Zephyrus"
);

# ---------------------------------------------------------
# 2. STRING RENDERING & DATA PROCESSING
# ---------------------------------------------------------

# Sort array safely and filter out duplicates
my @sorted_names = sort { lc($a) cmp lc($b) } @names;

# Build the <datalist> options block 
my $datalist_options = "";
foreach my $name (@sorted_names) {
    $datalist_options .= qq(        <option value="$name">\n);
}

# Build the native JavaScript array payload string
my $js_array_payload = join ",\n            ", map { qq("$_") } @sorted_names;

# Read CSS/HTML template styling blocks out of __DATA__
my $html_template = do { local $/; <DATA> };

# Output file definition 
my $output_filename = "index.html";
open(my $fh, '>', $output_filename) or die "Could not open '$output_filename' for writing: $!";
binmode($fh, ":utf8");

# Interpolate strings cleanly into the final structural layout
print $fh <<EOF;
$html_template
    <datalist id="names-datalist">
$datalist_options    </datalist>

    <main id="directory">
        </main>

    <footer>
        <p>Omnia mutantur, nihil interit.</p>
    </footer>

    <script>
        // Dynamically injected array payload from Perl backend configurations
        const names = [
            $js_array_payload
        ];

        const directory = document.getElementById('directory');
        const searchInput = document.getElementById('name-search');

        // Helper to cleanly strip diacritics for URL and alphabetizing groupings
        function cleanName(str) {
            return str.normalize("NFD").replace(/[\\u0300-\\u036f]/g, "");
        }

        // Build the structured alphabetical page layout dynamically
        function renderDirectory(filterText = '') {
            directory.innerHTML = '';
            
            // Group names by their starting letter
            const groups = {};
            names.forEach(name => {
                const clean = cleanName(name);
                if (filterText && !clean.toLowerCase().includes(filterText.toLowerCase())) return;
                
                const firstLetter = clean.charAt(0).toUpperCase();
                if (!groups[firstLetter]) groups[firstLetter] = [];
                groups[firstLetter].push(name);
            });

            // Append structured DOM nodes for matched letters
            Object.keys(groups).sort().forEach(letter => {
                const section = document.createElement('section');
                section.className = 'letter-group';

                const heading = document.createElement('h2');
                heading.className = 'letter-heading';
                heading.textContent = letter;
                section.appendChild(heading);

                const grid = document.createElement('div');
                grid.className = 'name-grid';

                groups[letter].forEach(name => {
                    const clean = cleanName(name);
                    const a = document.createElement('a');
                    a.className = 'name-link';
                    // Open the designated target structure in a blank tab
                    a.href = `https://translate.google.com/?sl=la&tl=en&text=\${encodeURIComponent(clean)}&op=translate`;
                    a.target = '_blank';
                    a.rel = 'noopener';
                    a.textContent = name;
                    grid.appendChild(a);
                });

                section.appendChild(grid);
                directory.appendChild(section);
            });
        }

        // Connect user inputs to real-time interactive results 
        searchInput.addEventListener('input', (e) => {
            renderDirectory(e.target.value);
        });

        // Initialize display
        renderDirectory();
    </script>
</body>
</html>
EOF

close $fh;
print "Successfully generated layout inside: '$output_filename' with " . scalar(@sorted_names) . " entries.\n";

# ---------------------------------------------------------
# 3. STATIC HTML / INK STYLESHEET SKELETON
# ---------------------------------------------------------
__DATA__
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Metamorphoses Pronunciations</title>
    <style>
        :root {
            --bg-color: #f2ebd9; /* Nicotine-stained manuscript paper */
            --text-color: #1a1816; /* Faded carbon-ribbon black */
            --border-color: #3a3530; /* Heavy typewriter ink grubbiness */
            --card-bg: #eae2cf; /* Slightly darker paper backing */
            --accent-color: #8b261e; /* Dried bull-blood editorial ink red */
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            /* Hard-boiled, analog typewriter styling */
            font-family: "Courier New", Courier, monospace;
            background-color: var(--bg-color);
            color: var(--text-color);
            line-height: 1.4;
            padding: 30px 15px;
            background-image: 
                /* Subtle grit texture */
                radial-gradient(rgba(0,0,0,0.03) 1px, transparent 0),
                radial-gradient(rgba(0,0,0,0.03) 1px, transparent 0);
            background-size: 8px 8px;
            background-position: 0 0, 4px 4px;
        }

        header {
            text-align: left;
            margin-bottom: 40px;
            padding-bottom: 15px;
            border-bottom: 3px double var(--border-color);
            position: relative;
        }

        /* Redlined title */
        h1 {
            font-size: 2.2rem;
            font-weight: 900;
            color: var(--accent-color);
            letter-spacing: -1px;
            transform: rotate(-1deg); /* Skewed typewriter carriage alignment */
            display: inline-block;
        }

        p.subtitle {
            margin-top: 10px;
            font-size: 0.85rem;
            color: var(--text-color);
            font-weight: bold;
            letter-spacing: 1px;
        }

        /* Cut-up method Search Bar */
        .search-container {
            position: sticky;
            top: 0;
            z-index: 100;
            margin-bottom: 40px;
            background: var(--bg-color);
            padding: 15px 0;
            border-bottom: 1px dashed var(--border-color);
        }

        input[type="search"] {
            width: 100%;
            padding: 12px;
            font-family: "Courier New", Courier, monospace;
            font-size: 1.1rem;
            font-weight: bold;
            color: var(--text-color);
            border: 3px solid var(--border-color);
            border-radius: 0px; /* Absolutely no soft, rounded corners */
            background-color: var(--card-bg);
            outline: none;
            box-shadow: 4px 4px 0px var(--border-color); /* Brutalist offset shadow */
            transition: all 0.1s ease;
        }

        input[type="search"]:focus {
            background-color: #fffdec;
            box-shadow: 1px 1px 0px var(--border-color);
            transform: translate(3px, 3px);
        }

        /* Letter Sections */
        .letter-group {
            margin-bottom: 35px;
            position: relative;
        }

        .letter-heading {
            font-size: 1.8rem;
            font-weight: 900;
            color: var(--accent-color);
            border-bottom: 2px solid var(--border-color);
            padding-bottom: 2px;
            margin-bottom: 15px;
            display: inline-block;
            width: 100%;
        }

        /* Jagged Grid of Names */
        .name-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(130px, 1fr));
            gap: 8px;
        }

        /* The "Cut-Up" Word Links */
        .name-link {
            display: block;
            padding: 10px 6px;
            background: var(--card-bg);
            border: 2px solid var(--border-color);
            border-radius: 0px;
            text-decoration: none;
            color: var(--text-color);
            font-weight: bold;
            font-size: 0.9rem;
            text-align: center;
            word-break: break-all;
            box-shadow: 2px 2px 0px var(--border-color);
            transition: transform 0.05s, box-shadow 0.05s;
        }

        /* Interactive chaotic states */
        @media (hover: hover) {
            .name-link:hover {
                background-color: var(--text-color);
                color: var(--bg-color); /* High contrast negative flip */
                transform: translate(-1px, -1px);
                box-shadow: 3px 3px 0px var(--accent-color);
            }
        }

        .name-link:active {
            transform: translate(2px, 2px);
            box-shadow: 0px 0px 0px var(--border-color);
        }

        /* Stamped footer note */
        footer {
            text-align: left;
            margin-top: 60px;
            padding-top: 20px;
            border-top: 1px dashed var(--border-color);
            font-size: 0.8rem;
            font-weight: bold;
            color: var(--accent-color);
            text-transform: uppercase;
        }    
    </style>
</head>
<body>

    <header>
        <h1>Metamorphoses</h1>
        <p class="subtitle">Select a proper name to hear its Latin pronunciation</p>
    </header>

    <div class="search-container">
        <input 
            type="search" 
            id="name-search" 
            list="names-datalist" 
            placeholder="Type a name to search (e.g., Daphne)..."
            autocomplete="off"
        >
    </div>