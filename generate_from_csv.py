import csv
import requests
import base64
import os

PROMPT_CSV = '/prompts/prompts.csv'
OUTPUT_DIR = '/outputs'

def generate_image(prompt):
    url = "http://localhost:7860/sdapi/v1/txt2img"
    payload = {"prompt": prompt}
    response = requests.post(url, json=payload)
    r = response.json()
    for idx, img in enumerate(r['images']):
        with open(f"{OUTPUT_DIR}/{prompt[:50].replace(' ', '_')}_{idx}.png", "wb") as f:
            f.write(base64.b64decode(img))

with open(PROMPT_CSV, newline='') as csvfile:
    reader = csv.reader(csvfile)
    for row in reader:
        if row:
            generate_image(row[0])
