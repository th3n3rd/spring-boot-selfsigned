# Spring Boot Self-signed Certificates

This repository hosts an example of a spring boot application that is provisioned with a custom self-signed certificates at runtime.

## How does it work?

The application is built using cloud native buildpacks, and one of them is capable of consuming a service binding of type `ca-certificates` in order
to populate a specific file within the container, whihc in turn is used to populate the java truststore loaded in the JVM.

In order to inject that binding we need to mount a directory with the following structure

```
bindings
└── <name-of-the-binding>
    ├── <certificate-file>.crt
    └── type

```

Where type is a simple file which contents equal to `ca-certificates`.
