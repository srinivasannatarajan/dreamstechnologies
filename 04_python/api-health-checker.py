#!/usr/bin/env python3

"""
API Health Checker
Sends HTTP GET request to a URL and reports health status.
"""

import sys
import requests
from urllib.parse import urlparse


def check_health(url, timeout=5):
    """
    Check health of an API endpoint.
    
    Args:
        url: The URL to check
        timeout: Request timeout in seconds
    
    Returns:
        Tuple of (status_code, status_message)
    """
    
    try:
        print(f"Checking health of: {url}")
        print(f"Timeout: {timeout} seconds")
        print("-" * 60)
        
        # Send GET request
        response = requests.get(url, timeout=timeout)
        
        # Get status code
        status_code = response.status_code
        
        # Determine health status
        if status_code == 200:
            status = "Healthy"
        else:
            status = "Down"
        
        # Display results
        print(f"Status Code: {status_code}")
        print(f"Response Time: {response.elapsed.total_seconds():.3f} seconds")
        print(f"Content Length: {len(response.content)} bytes")
        print("-" * 60)
        print(f"Status: {status}")
        print("-" * 60)
        
        return status_code, status
        
    except requests.exceptions.Timeout:
        print(f" Status: Down (Timeout after {timeout}s)")
        print("-" * 60)
        return None, "Down"
    except requests.exceptions.ConnectionError:
        print(" Status: Down (Connection Error)")
        print("-" * 60)
        return None, "Down"
    except requests.exceptions.RequestException as e:
        print(f" Status: Down (Error: {str(e)})")
        print("-" * 60)
        return None, "Down"


def validate_url(url):
    """Validate URL format."""
    
    try:
        result = urlparse(url)
        return all([result.scheme, result.netloc])
    except:
        return False


def main():
    """Main function."""
    
    if len(sys.argv) < 2:
        print("Usage: python api-health-checker.py <url>")
        print("Example: python api-health-checker.py https://api.github.com")
        sys.exit(1)
    
    url = sys.argv[1]
    
    # Validate URL
    if not validate_url(url):
        print("Error: Invalid URL format!")
        print("URL must include scheme (http:// or https://)")
        sys.exit(1)
    
    # Check health
    print("=" * 60)
    print("API HEALTH CHECKER")
    print("=" * 60)
    
    status_code, status = check_health(url)
    
    # Exit with appropriate code
    sys.exit(0 if status == "Healthy" else 1)


if __name__ == "__main__":
    main()
