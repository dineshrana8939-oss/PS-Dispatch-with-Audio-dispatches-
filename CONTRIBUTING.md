# Contributing to PS-Dispatch with Audio Alerts

Thank you for your interest in contributing! This is a free, community-driven project.

## How to Contribute

### Reporting Issues
- Check if the issue already exists
- Provide clear steps to reproduce
- Include your FiveM server version and framework (QBCore/ESX)
- Include relevant console errors

### Suggesting Features
- Open an issue with the "feature request" label
- Describe the feature and use case
- Consider if it maintains the "minimal and free" philosophy

### Code Contributions

#### Adding New Dispatch Codes
1. Edit `shared/config.lua`
2. Add your code to `Config.DispatchCodes` table
3. Follow existing format:
```lua
['YOUR-CODE'] = {
    displayCode = 'YOUR-CODE',
    description = 'Brief Description',
    message = 'Dispatch message shown to players',
    job = 'police', -- or 'ems' or 'fire'
    blipSprite = 58,
    blipColor = 1,
    audioType = 'police' -- or 'ems', 'fire', 'general', 'priority'
}
```
4. Test thoroughly before submitting

#### Improving Documentation
- Fix typos and unclear instructions
- Add more integration examples
- Translate to other languages
- Add troubleshooting tips

#### Code Style
- Follow existing Lua conventions
- Use clear variable names
- Add comments for complex logic
- Keep functions focused and small

#### Testing
- Test with both QBCore and ESX
- Test in standalone mode
- Verify audio plays correctly
- Check blips appear and disappear
- Test admin commands work

### Pull Request Process
1. Fork the repository
2. Create a feature branch (`feature/your-feature-name`)
3. Make your changes
4. Test thoroughly
5. Update documentation if needed
6. Submit pull request with clear description

### Code of Conduct
- Be respectful and constructive
- Help others learn and improve
- Credit original work appropriately
- Keep discussions professional

## Development Setup

### Local Testing
1. Clone the repository
2. Place in your FiveM server's resources folder
3. Add to server.cfg: `ensure ps-dispatch-audio`
4. Restart your server
5. Test with `/ps-dispatch-test 10-10`

### Audio File Testing
- Create test .ogg files for development
- Test with InteractSound and without
- Verify volume levels are appropriate
- Check audio plays on dispatch trigger

## Questions?
Open an issue for questions or discussions!

## License
By contributing, you agree that your contributions will be licensed under the same license as the main project.

---

Thank you for helping make this project better! 🎉
