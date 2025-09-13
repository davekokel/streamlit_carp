from supa_client import SB, save_current_session
try:
    _orig = SB.auth.sign_in_with_password
    def _wrapped(creds):
        res = _orig(creds)
        try:
            save_current_session()
        except Exception:
            pass
        return res
    SB.auth.sign_in_with_password = _wrapped
except Exception:
    pass
