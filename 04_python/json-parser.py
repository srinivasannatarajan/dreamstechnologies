#!/usr/bin/env python3

"""
JSON File Parser
Reads a JSON file containing server details and prints only production servers.
"""

import json
import sys
from pathlib import Path


def parse_servers(json_file):
    """Parse JSON file and filter production servers."""
    
    try:
        # Read JSON file
        with open(json_file, 'r') as f:
            data = json.load(f)
        
        # Extract servers list
        servers = data.get('servers', [])
        
        # Filter production servers
        production_servers = [
            server for server in servers 
            if server.get('environment', '').lower() == 'production'
        ]
        
        # Display results
        print("=" * 60)
        print("PRODUCTION SERVERS")
        print("=" * 60)
        print(f"Total servers: {len(servers)}")
        print(f"Production servers: {len(production_servers)}")
        print("=" * 60)
        print()
        
        if production_servers:
            for idx, server in enumerate(production_servers, 1):
                print(f"Server #{idx}")
                print(f"  Name: {server.get('name', 'N/A')}")
                print(f"  IP Address: {server.get('ip_address', 'N/A')}")
                print(f"  Environment: {server.get('environment', 'N/A')}")
                print(f"  OS: {server.get('os', 'N/A')}")
                print(f"  Status: {server.get('status', 'N/A')}")
                print(f"  Region: {server.get('region', 'N/A')}")
                print()
        else:
            print("No production servers found.")
        
        print("=" * 60)
        
    except FileNotFoundError:
        print(f"Error: File '{json_file}' not found!")
        sys.exit(1)
    except json.JSONDecodeError:
        print(f"Error: Invalid JSON format in '{json_file}'!")
        sys.exit(1)
    except Exception as e:
        print(f"Error: {str(e)}")
        sys.exit(1)


def main():
    """Main function."""
    
    if len(sys.argv) < 2:
        print("Usage: python json-parser.py <json_file>")
        print("Example: python json-parser.py sample-servers.json")
        sys.exit(1)
    
    json_file = sys.argv[1]
    parse_servers(json_file)


if __name__ == "__main__":
    main()
