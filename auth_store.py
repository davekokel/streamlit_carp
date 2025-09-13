from pathlib import Path
import json
APP_DIR = (Path.home()/".config"/"streamlit_carp")
APP_DIR.mkdir(parents=True, exist_ok=True)
AUTH_FILE = APP_DIR/"auth.json"
def load_session():
    try:
        data = json.loads(AUTH_FILE.read_text())
        if "access_token" in data and "refresh_token" in data:
            return data
    except Exception:
        pass
    return None
def save_session(access_token, refresh_token):
    AUTH_FILE.write_text(json.dumps({"access_token": access_token, "refresh_token": refresh_token}))
    return True
def clear_session():
    try:
        AUTH_FILE.unlink()
    except Exception:
        pass
