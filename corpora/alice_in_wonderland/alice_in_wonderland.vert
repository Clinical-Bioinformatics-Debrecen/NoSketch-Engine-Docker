import spacy

# Load English model
nlp = spacy.load("en_core_web_sm")

# Paths
input_file = r"raw_texts\pg11.txt"
output_file = r"corpora\alice_in_wonderland\alice_in_wonderland.vert"

# Read raw text
with open(input_file, "r", encoding="utf-8") as f:
    text = f.read()

# Process text
doc = nlp(text)

# Open vertical file for writing
with open(output_file, "w", encoding="utf-8") as f:
    f.write('<doc id="1">\n')
    for sent_id, sent in enumerate(doc.sents, start=1):
        f.write(f'<s id="{sent_id}">\n')
        for token_id, token in enumerate(sent, start=1):
            # id, word, lemma, UPOS, XPOS, head, deprel
            f.write(f"{token_id}\t{token.text}\t{token.lemma_}\t{token.pos_}\t{token.tag_}\t{token.head.i+1}\t{token.dep_}\n")
        f.write('</s>\n')
    f.write('</doc>\n')
