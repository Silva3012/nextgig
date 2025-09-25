# South African ID Verification API

A robust, scalable Spring Boot microservice for verifying South African IDs, CVs, and portfolio links using Google Vision API OCR and AI-powered analysis.

## 🚀 Features

- **South African ID Verification**: Comprehensive validation with Luhn algorithm and birth date extraction
- **Google Vision OCR**: Accurate text extraction from ID documents
- **CV Analysis**: AI-powered analysis of curriculum vitae content and quality scoring
- **Portfolio Link Verification**: Automated validation of portfolio accessibility and content
- **Confidence Scoring**: Weighted scoring system for overall verification reliability
- **RESTful API**: Clean, well-documented endpoints with proper error handling
- **MongoDB Integration**: Persistent storage with advanced querying capabilities
- **Security**: JWT authentication, rate limiting, and input validation
- **Docker Support**: Containerized deployment with Docker Compose

## 🛠 Technology Stack

- **Java 17** - Primary programming language
- **Spring Boot 3.2** - Application framework
- **MongoDB** - NoSQL database
- **Google Cloud Vision API** - OCR and text extraction
- **Maven** - Dependency management
- **Docker** - Containerization
- **Spring Security** - Authentication and authorization
- **Spring Data MongoDB** - Database operations
- **RestClient** - HTTP client for external API calls

## 📋 Prerequisites

Before running this application, ensure you have:

- Java 17 or higher
- Maven 3.6+
- MongoDB 5.0+ (local or Atlas)
- Docker and Docker Compose (optional)
- Google Cloud Vision API credentials


### Google Cloud Vision Setup

1. Create a project in [Google Cloud Console](https://console.cloud.google.com/)
2. Enable the Vision API
3. Create service account credentials
4. Download JSON key file and set environment variable:
```bash
export GOOGLE_APPLICATION_CREDENTIALS="path/to/your/credentials.json"
```

## 📚 API Documentation

### Base URL
```
http://localhost:8080/api/sa-id
```

### Endpoints

#### 1. Verify Documents
```http
POST /verify
Content-Type: multipart/form-data

Body:
- idImage: file (required)
- cvFile: file (optional)
- portfolioLinks: string[] (optional)
- userId: string (required)
```

**Response:**
```json
{
  "verificationId": "VER_1700000000000_ABC12345",
  "status": "COMPLETED",
  "idVerification": {
    "idNumber": "9001015009089",
    "validFormat": true,
    "checksumValid": true,
    "birthDate": "1990-01-01",
    "citizenship": "South African Citizen",
    "extractedNames": ["John Doe"]
  },
  "cvAnalysis": {
    "qualityScore": 8.5,
    "skills": ["Java", "Spring Boot", "MongoDB"],
    "summary": "Senior Software Engineer with 10+ years experience"
  },
  "portfolioVerification": {
    "totalLinks": 2,
    "accessibleLinks": 2,
    "linkStatus": {
      "https://github.com/johndoe": true,
      "https://linkedin.com/in/johndoe": true
    }
  },
  "confidenceScore": 0.85
}
```

#### 2. Get Verification Result
```http
GET /result/{verification-id}
```


## 🔍 South African ID Validation

The service implements comprehensive SA ID validation:

- **Format Check**: 13-digit number validation
- **Luhn Algorithm**: Checksum verification
- **Birth Date Extraction**: YYMMDD format parsing
- **Citizenship Check**: Digit-based citizenship determination
- **Age Validation**: Logical date validation

### ID Number Format
```
YYMMDD SSSS CAZ
│     │    │  │
│     │    │  └─ Check digit
│     │    └──── Citizenship (0=SA, 1=Perm Resident)
│     └───────── Sequential number
└─────────────── Birth date (YYMMDD)
```

### API Testing with curl
```bash
# Verify documents
curl -X POST http://localhost:8080/api/sa-id/verify \
  -F "idImage=@id_card.jpg" \
  -F "cvFile=@resume.pdf" \
  -F "userId=test123" \
  -F "portfolioLinks=https://github.com/test"
```

## 🔒 Security Features

- Input validation and sanitization
- File type verification
- Rate limiting (10 requests/minute)
- JWT authentication (optional)
- CORS configuration
- Secure headers

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Commit changes: `git commit -m 'Add amazing feature'`
4. Push to branch: `git push origin feature/amazing-feature`
5. Open a pull request

## 🙏 Acknowledgments

- Google Cloud Vision API for OCR capabilities
- Spring Boot team for the excellent framework
- MongoDB for robust data storage
- South African Department of Home Affairs for ID format specifications

---

**Built with ❤️ for secure document verification in South Africa**