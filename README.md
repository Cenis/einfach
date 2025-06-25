# HTTP Digest Authentication - Demo

This is a small demo project in plain HTML and JavaScript to illustrate the **HTTP Digest** authentication process.

## Implementation Details

### Client-Side Implementation
The main implementation is in `html/scripts/digestAuth.js`. The key components include:

1. **Initial Request**: Makes an unauthenticated request to trigger a 401 response
2. **Header Parsing**: Extracts authentication parameters from the WWW-Authenticate header
3. **Hash Generation**: Implements the MD5-based digest authentication algorithm:
   - HA1 = MD5(username:realm:password)
   - HA2 = MD5(method:uri)
   - Response = MD5(HA1:nonce:nc:cnonce:qop:HA2)
4. **Authenticated Request**: Sends the digest authentication header

### Server-Side Protection (Vertiefung)
The `/protected` directory is secured using Apache's HTTP Digest authentication:

- **`.htaccess`**: Configures digest authentication for the protected directory
- **`.htpasswd`**: Contains the digest hash for user "Pippi" with password "PippilottaViktualia"

The digest hash was generated using the formula: MD5(username:realm:password)
- Username: Pippi
- Realm: Protected Area  
- Password: PippilottaViktualia
- Hash: 5d7d68c0dff8d29aab0e5d0c85ba84c2

## Available Test Credentials

For the external API endpoint `https://m183.gibz-informatik.ch/api/httpDigestAuth`:

| Username    | Password      |
| ----------- | ------------- |
| `britney_s` | `hitMeBaby`   |
| `bon_jovi`  | `badMedicine` |
| `shakira`   | `hipsDontLie` |
| `tom_j`     | `sexbomb`     |

For the local protected directory:
- Username: `Pippi`
- Password: `PippilottaViktualia`

## Running the Application

Navigate to the project directory and start the Docker composition:

```bash
# Start the application
docker compose up

# Rebuild and start (if changes were made)
docker compose up --build
```

Access the demo website at [http://localhost:8183](http://localhost:8183).

To test the protected directory, visit [http://localhost:8183/protected/](http://localhost:8183/protected/) and use the credentials above.

## Technical Implementation Notes

- The client-side implementation follows RFC 2617 specifications for HTTP Digest Authentication
- Proper quoting of digest parameters is implemented according to RFC standards
- The nonce count (nc) starts at "00000001" and the client nonce (cnonce) is randomly generated
- Server-side protection uses Apache's mod_auth_digest module
- All hash calculations use MD5 as specified in the digest authentication standard