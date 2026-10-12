#!/usr/bin/env python3
"""Rule-based incident summary helper; no external AI/API is used."""
import sys

def analyze(text: str) -> str:
    t = text.lower()
    rules = [
        (("connection refused", "connection error"), "Check whether the target service/container is running and whether the port mapping is correct."),
        (("out of memory", "oom", "memory"), "Inspect memory limits and container logs; adjust limits only after measuring usage."),
        (("timeout", "timed out"), "Check dependency health, network connectivity, request timeout settings, and slow operations."),
        (("permission denied", "forbidden"), "Review file ownership, container user, filesystem permissions, and least-privilege access."),
        (("image pull", "manifest unknown"), "Verify the image name/tag and registry access; ensure the image exists."),
        (("health check", "unhealthy", "healthcheck"), "Inspect application logs and test the health endpoint inside and outside the container."),
    ]
    hints = [advice for keys, advice in rules if any(key in t for key in keys)]
    if not hints:
        hints.append("Collect the exact error, timestamp, recent changes, service logs, and health-check results before changing settings.")
    lines = [f"{i}. {hint}" for i, hint in enumerate(hints, 1)]
    return f"Incident input: {text}\n\nSuggested investigation:\n" + "\n".join(lines) + "\n\nThis is rule-based guidance; verify suggestions against logs and metrics."

if __name__ == "__main__":
    raw = " ".join(sys.argv[1:]) or sys.stdin.read().strip()
    if not raw:
        print('Usage: python ai/incident_analysis.py "container unhealthy"')
        raise SystemExit(2)
    print(analyze(raw))
