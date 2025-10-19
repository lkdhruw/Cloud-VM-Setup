import subprocess
import re
import google.generativeai as genai # pip install google-generativeai

# CONFIG: Set your Gemini API key
genai.configure(api_key = <GEMINI_API_KEY>)

def ask_gemini_for_pip_command(module_name):
    prompt = f"Give me the exact pip install command for the Python module '{module_name}'. Only output the command."
    model = genai.GenerativeModel("gemini-2.0-flash")
    response = model.generate_content(prompt)
    return response.text.strip()

while True:
    # print(".")
    # Run server and capture output
    process = subprocess.run(
        ["python", "KrishiRaftaarWeb/manage.py", "check"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True
    )

    combined_output = (process.stdout or "") + "\n" + (process.stderr or "")
    print(combined_output)
    
    if process.returncode == 0:
        print("✅ Server started successfully — all modules installed.")
        break

    # Look for missing module in full output
    match = re.search(r"No module named '([^']+)'", combined_output)
    if match:
        module_name = match.group(1)
        print(f"📦 Missing module detected: {module_name}")

        # Ask Gemini for the pip command
        pip_command = ask_gemini_for_pip_command(module_name)
        print(f"💡 Installing via: {pip_command}")

        # Install the package
        subprocess.run(pip_command.split(), check=True)
    else:
        print("❌ Error is not a ModuleNotFoundError — stopping.")
        print(combined_output)
        break
