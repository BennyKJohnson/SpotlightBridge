#  Spotlight Bridge

The missing extension API for macOS Spotlight.

## Goals
- Allow users to customise Spotlight for better integration into their workflow
- Empower developers through a simple but featured API to allow them to write powerful third party integrations for Spotlight

## Architecture

### Spotlight Bridge (Injector)
The main bundle that it is injected into Spotlight to add additional capabilities that enable third party extensions

### Spotlight Bridge Framework
The framework that provides the interface to Spotlight Bridge. Developers add this framework to their extension to allow them to respond to user queries from Spotlight.
