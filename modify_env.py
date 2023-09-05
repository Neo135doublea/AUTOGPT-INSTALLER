import sys

# Get the API key from the command line arguments
api_key = sys.argv[1]

# Read the env.template file
with open('env.template', 'r') as file:
    content = file.readlines()

# Modify the line with the API key
for index, line in enumerate(content):
    if line.startswith('OPENAI_API_KEY='):
        content[index] = f'OPENAI_API_KEY={api_key}\n'
        break

# Write the modified content to .env
with open('.env', 'w') as file:
    file.writelines(content)
