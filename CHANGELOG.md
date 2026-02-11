# Changelog

All notable changes to PS-Dispatch with Audio Alerts will be documented in this file.

## [1.0.0] - 2026-02-11

### Added
- Initial release of PS-Dispatch with Audio Alerts
- Complete dispatch system for FiveM servers
- Support for custom .ogg audio files per dispatch type
- 17 pre-configured dispatch codes:
  - 11 Police codes (10-10 through 10-99)
  - 3 EMS codes (EMS-1 through EMS-3)
  - 2 Fire codes (FIRE-1, FIRE-2)
- Framework support for QBCore and ESX
- Standalone mode without framework requirement
- InteractSound integration for enhanced audio
- Fallback native audio support
- GPS blips with automatic cleanup
- Job-based dispatch filtering
- Admin test commands with ACE permission security
- Comprehensive documentation:
  - README.md with full feature list
  - INSTALLATION.md quick start guide
  - Integration examples for common scenarios
  - server.cfg configuration example
- Example integration scripts:
  - Store robbery integration
  - EMS/medical emergency integration
  - Police chase and incident integration

### Features
- **Audio Alerts**: Different audio files for police, EMS, fire, general, and priority dispatches
- **Smart Filtering**: Only sends dispatches to relevant job types
- **Auto-cleanup**: Blips automatically remove after configurable time (default 30 seconds)
- **Export Support**: Easy integration with other resources via exports
- **Event Support**: Can also trigger via TriggerEvent
- **Configurable**: Extensive config options for customization
- **Overflow Protection**: Blip ID counter with max value to prevent overflow

### Security
- ACE permission system for admin test commands
- Server-side validation of dispatch events
- No client-side exploits for triggering dispatches
- Input validation for dispatch codes

### Credits
- Full credit to Project Sloth for the original PS-Dispatch concept
- This is a community-created free alternative implementation
