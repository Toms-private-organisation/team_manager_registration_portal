import 'package:flutter_test/flutter_test.dart';
import 'package:team_manager_registration/utils/ValidationUtils.dart';

void main() {
  group('ValidationUtils', () {
    group('isValidEmail', () {
      test('should return true for valid email addresses', () {
        expect(ValidationUtils.isValidEmail('test@example.com'), isTrue);
        expect(ValidationUtils.isValidEmail('user.name@domain.co.uk'), isTrue);
        expect(ValidationUtils.isValidEmail('user+tag@domain.org'), isTrue);
      });

      test('should return false for invalid email addresses', () {
        expect(ValidationUtils.isValidEmail(''), isFalse);
        expect(ValidationUtils.isValidEmail('invalid-email'), isFalse);
        expect(ValidationUtils.isValidEmail('@domain.com'), isFalse);
        expect(ValidationUtils.isValidEmail('user@'), isFalse);
        expect(ValidationUtils.isValidEmail('user@domain'), isFalse);
      });

      test('should return false for extremely long email addresses', () {
        final longEmail = '${'a' * 250}@example.com';
        expect(ValidationUtils.isValidEmail(longEmail), isFalse);
      });
    });

    group('isValidPassword', () {
      test('should return true for valid passwords', () {
        expect(ValidationUtils.isValidPassword('password123'), isTrue);
        expect(ValidationUtils.isValidPassword('MyPassword1'), isTrue);
        expect(ValidationUtils.isValidPassword('longpassword456'), isTrue);
      });

      test('should return false for invalid passwords', () {
        expect(ValidationUtils.isValidPassword(''), isFalse);
        expect(ValidationUtils.isValidPassword('short'), isFalse);
        expect(ValidationUtils.isValidPassword('12345678'), isFalse); // Only numbers
        expect(ValidationUtils.isValidPassword('onlyletters'), isFalse); // Only letters
      });
    });

    group('getPasswordValidationError', () {
      test('should return null for valid passwords', () {
        expect(ValidationUtils.getPasswordValidationError('password123'), isNull);
      });

      test('should return appropriate error messages', () {
        expect(
          ValidationUtils.getPasswordValidationError(''),
          equals('Password is required'),
        );
        expect(
          ValidationUtils.getPasswordValidationError('short'),
          equals('Password must be at least 8 characters long'),
        );
        expect(
          ValidationUtils.getPasswordValidationError('12345678'),
          equals('Password must contain at least one letter'),
        );
        expect(
          ValidationUtils.getPasswordValidationError('onlyletters'),
          equals('Password must contain at least one number'),
        );
      });
    });

    group('getEmailValidationError', () {
      test('should return null for valid emails', () {
        expect(ValidationUtils.getEmailValidationError('test@example.com'), isNull);
      });

      test('should return appropriate error messages', () {
        expect(
          ValidationUtils.getEmailValidationError(''),
          equals('Email is required'),
        );
        expect(
          ValidationUtils.getEmailValidationError('invalid-email'),
          equals('Please enter a valid email address'),
        );
      });
    });

    group('sanitizeInput', () {
      test('should remove dangerous characters', () {
        expect(
          ValidationUtils.sanitizeInput('<script>alert("xss")</script>'),
          equals('scriptalert(xss)/script'),
        );
        expect(
          ValidationUtils.sanitizeInput('Hello "world"'),
          equals('Hello world'),
        );
        expect(
          ValidationUtils.sanitizeInput("It's a 'test'"),
          equals('Its a test'),
        );
      });

      test('should normalize whitespace', () {
        expect(
          ValidationUtils.sanitizeInput('  multiple   spaces  '),
          equals('multiple spaces'),
        );
        expect(
          ValidationUtils.sanitizeInput('tabs\tand\nnewlines'),
          equals('tabs and newlines'),
        );
      });

      test('should trim input', () {
        expect(
          ValidationUtils.sanitizeInput('  trimmed  '),
          equals('trimmed'),
        );
      });
    });
  });
}