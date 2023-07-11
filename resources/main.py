"""Function to generate some dummy log data in Datadog."""

import logging
import sys
import time

import requests

try:
    public_ip = requests.get(
        "https://api.ipify.org",
        timeout=5
    ).text
except requests.exceptions.RequestException as error_message:
    raise SystemExit from error_message

# Configure logging
logging.basicConfig(
    format=(
        "{"
        '"time":"%(asctime)s",'
        ' "name": "%(name)s",'
        ' "level": "%(levelname)s",'
        ' "message": "%(message)s"'
        ' "username": "tjtharrison",'
        f' "source_ip": "{public_ip}"'
        "}"
    ),
    level=logging.INFO,
    filename="logs/output.log",
    filemode="a",
    datefmt="%Y-%m-%d %H:%M:%S",
)


def main():
    """Main function."""
    try:
        logging.debug("Public IP address is: %s",  public_ip)
    except SystemExit:
        logging.error("Unable to get public IP address.")
        sys.exit(1)

    while True:
        logging.info("Generating logs..")
        time.sleep(2)


if __name__ == "__main__":
    main()
