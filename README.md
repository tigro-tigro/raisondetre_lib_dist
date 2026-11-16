# raisondetre_lib_dist
------------
A C++ library for API server used to integrate with popular Cloud native databases (AWS, Azure, GCP).


## License
Please create ticket/issue on this Git repo to get commercial license key.
Information needed:
- Email
- Platform operating system and version
- Country (due to export restrictions)

## 1. Create a `vcpkg-configuration.json`
```
{
  "default-registry": {
    "kind": "git",
    "baseline": "b1b19307e2d2ec1eefbdb7ea069de7d4bcd31f01",
    "repository": "https://github.com"
  },
  "registries": [
    {
      "kind": "git",
      "repository": "https://github.com/tigro-tigro/raisondetre_lib_dist",
      "baseline": "5b23921d69a904b57dd347cbdb3f740f406ffc34",
      "packages": [
        "raisondetre"
      ]
    }
  ]
}
```
## 2. Add on the CmakeLists.txt
```
find_package(raisondetre CONFIG REQUIRED)
target_link_libraries(your_target PRIVATE raisondetre::raisondetre)
```
## 3. Call the VCPKG install manually
```
vcpkg install raisondetre[debian-trixie-slim]
```

