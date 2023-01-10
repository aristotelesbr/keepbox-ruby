# keepbox-ruby

Keepbox is a simple, secure, and private way to store and share files. It's a great alternative to Dropbox, Google Drive, and other file sharing services.

It syncs files from a local directory to an Amazon S3 bucket. It's a simple Ruby script that uses the AWS SDK for Ruby. Good for individuals and small teams. God bye Dropbox! 👋 🚀 🚀 🚀

<svg color-interpolation-filters="sRGB" preserveAspectRatio="xMidYMid meet" viewBox="0 0 340 250" xmlns="http://www.w3.org/2000/svg"><rect fill="none" height="100%" width="100%"/><rect fill="none" height="100%" width="100%"/><g fill="#333"><g transform="translate(77.478134 108.277271)"><path d="m0 0h33.445456v33.445456h-33.445456z" fill="none" stroke-width="2"/><svg height="33.445456" overflow="visible" width="33.445456"><svg viewBox="0 0 74.44999695 74.44999695" xmlns="http://www.w3.org/2000/svg"><path d="m0 0h74.45l-74.45 74.45z" fill="#2799c8" opacity=".8"/><path d="m74.45 74.45-74.45-74.45v74.45z" fill="#0069ae" opacity=".8"/></svg></svg></g><g fill="#333"><path d="m19.56-6.14v6.14h-16.55v-27.87h16.55v6.04h-9.02v4.39h8.35v6.04h-8.35v5.26z" transform="translate(111.46606 138.964202)"/><path d="m19.56-6.14v6.14h-16.55v-27.87h16.55v6.04h-9.02v4.39h8.35v6.04h-8.35v5.26z" transform="translate(131.46606 138.964202)"/><path d="m23.24-19.01q0 4.67-2.76 7.22-2.75 2.54-7.82 2.54h-2.12v9.25h-7.53v-27.87h9.65q5.28 0 7.93 2.31 2.65 2.3 2.65 6.55zm-12.7-2.78v6.41h1.37q1.7 0 2.7-.96 1-.95 1-2.63 0-2.82-3.12-2.82z" transform="translate(151.46606 138.964202)"/><path d="m3.01 0v-27.87h9.72q5.69 0 8.44 1.69 2.76 1.68 2.76 5.25 0 2.34-1.21 4-1.2 1.66-3.16 2.14v.19q2.59.68 3.75 2.28 1.17 1.61 1.17 4.16 0 3.79-2.85 5.98-2.85 2.18-7.77 2.18zm7.53-22.17v4.99h2.27q1.62 0 2.51-.66.88-.67.88-1.99 0-2.34-3.54-2.34zm2.5 10.5h-2.5v5.86h2.65q3.53 0 3.53-2.98 0-1.39-.94-2.13-.95-.75-2.74-.75z" transform="translate(175.46606 138.964202)"/><path d="m29.09-13.97q0 7.03-3.45 10.69-3.45 3.66-10.1 3.66-6.56 0-10.06-3.68-3.5-3.68-3.5-10.71 0-6.96 3.48-10.63 3.48-3.67 10.12-3.67 6.65 0 10.08 3.64 3.43 3.64 3.43 10.7zm-19.18 0q0 8.08 5.63 8.08 2.86 0 4.24-1.96 1.38-1.97 1.38-6.12 0-4.18-1.4-6.17-1.4-1.99-4.18-1.99-5.67 0-5.67 8.16z" transform="translate(201.495503 138.964202)"/><path d="m18.63-13.67 9.49 13.67h-8.71l-5.44-8.71-5.37 8.71h-8.52l9.24-14.26-8.69-13.61h8.35l5.03 8.62 4.84-8.62h8.6z" transform="translate(234.401879 138.964202)"/></g></g></svg>

## Installation

Clone the repository and run the following commands:

```bash
bundle install
```

And turn keepbox.rb on executable:

```bash
chmod +x keepbox.rb
```

## Configuration

Export AWS credentials as environment variables:

```bash
export AWS_ACCESS_KEY_ID=YOUR_AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=YOUR_AWS_SECRET_ACCESS_KEY
```
And your bucket name and prefix folder to store files:

```bash
export BUCKET=YOUR_AWS_BUCKET
export PREFIX=YOUR_AWS_PREFIX
```

## Usage

Choice a directory to monitor and run keepbox.rb:

```bash
./keepbox.rb /path/to/your/directory
```

And that's it! 🎉 🎉 🎉

## Contributing

Bug reports and pull requests are welcome on GitHub at.

## License

MIT License - see LICENSE.md for details

☕️
