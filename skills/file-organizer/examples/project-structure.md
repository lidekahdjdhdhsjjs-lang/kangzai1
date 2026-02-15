# Project Structure Examples

## Basic Project Structure

```
project-name/
├── src/              # Source code
│   ├── main/
│   └── utils/
├── tests/            # Test files
│   ├── unit/
│   └── integration/
├── docs/             # Documentation
│   ├── api/
│   └── guides/
├── assets/           # Static assets
│   ├── images/
│   └── fonts/
├── config/           # Configuration
├── scripts/          # Build/deploy scripts
├── README.md
└── LICENSE
```

## Web Project Structure

```
web-project/
├── src/
│   ├── components/
│   ├── pages/
│   ├── utils/
│   └── styles/
├── public/
│   ├── index.html
│   └── favicon.ico
├── tests/
├── docs/
├── package.json
└── README.md
```

## Python Project Structure

```
python-project/
├── package_name/
│   ├── __init__.py
│   ├── core.py
│   └── utils.py
├── tests/
│   ├── __init__.py
│   └── test_core.py
├── docs/
├── scripts/
├── setup.py
├── requirements.txt
└── README.md
```

## Automated Structure Creation

```bash
# Create project structure
mkdir -p myproject/{src,tests,docs,assets,config}
mkdir -p myproject/src/{core,utils}
mkdir -p myproject/tests/{unit,integration}

# Add files
touch myproject/src/__init__.py
touch myproject/tests/__init__.py
touch myproject/README.md
```

## Best Practices

1. **Consistent naming**: Use kebab-case or snake_case consistently
2. **Group by type**: Separate code, tests, docs
3. **Keep it flat**: Avoid deep nesting
4. **Document structure**: Include README explaining layout
5. **Use templates**: Create templates for common structures
