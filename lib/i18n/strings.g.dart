
/*
 * Generated file. Do not edit.
 *
 * Locales: 1
 * Strings: 258 
 *
 * Built on 2024-03-03 at 18:24 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.en;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale {
	en, // 'en' (base locale, fallback)
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn _t = _currLocale.translations;
_StringsEn get t => _t;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale useDeviceLocale() {
		final locale = AppLocaleUtils.findDeviceLocale();
		return setLocale(locale);
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_t = _currLocale.translations;

		// force rebuild if TranslationProvider is used
		_translationProviderKey.currentState?.setLocale(_currLocale);

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String rawLocale) {
		final locale = AppLocaleUtils.parse(rawLocale);
		return setLocale(locale);
	}

	/// Gets current locale.
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
	AppLocaleUtils._(); // no constructor

	/// Returns the locale of the device as the enum type.
	/// Fallbacks to base locale.
	static AppLocale findDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			final typedLocale = _selectLocale(deviceLocale);
			if (typedLocale != null) {
				return typedLocale;
			}
		}
		return _baseLocale;
	}

	/// Returns the enum type of the raw locale.
	/// Fallbacks to base locale.
	static AppLocale parse(String rawLocale) {
		return _selectLocale(rawLocale) ?? _baseLocale;
	}
}

// context enums

// interfaces generated as mixins

// translation instances

late _StringsEn _translationsEn = _StringsEn.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.en.build(); // build
	/// String a = t.my.path; // access
	_StringsEn build() {
		switch (this) {
			case AppLocale.en: return _StringsEn.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _StringsEn translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

// Path: <root>
class _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build();

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	late final _StringsErrorsEn errors = _StringsErrorsEn._(_root);
	late final _StringsIntroEn intro = _StringsIntroEn._(_root);
	late final _StringsAuthenticationEn authentication = _StringsAuthenticationEn._(_root);
	late final _StringsSignUpEn signUp = _StringsSignUpEn._(_root);
	late final _StringsUserEn user = _StringsUserEn._(_root);
	late final _StringsMiscEn misc = _StringsMiscEn._(_root);
	late final _StringsTeamEn team = _StringsTeamEn._(_root);
	late final _StringsTeamMemberEn teamMember = _StringsTeamMemberEn._(_root);
	late final _StringsPaymentStatusEn paymentStatus = _StringsPaymentStatusEn._(_root);
	late final _StringsTransactionTypeEn transactionType = _StringsTransactionTypeEn._(_root);
	late final _StringsPhrasesEn phrases = _StringsPhrasesEn._(_root);
	late final _StringsEventsEn events = _StringsEventsEn._(_root);
	late final _StringsParticipantsEn participants = _StringsParticipantsEn._(_root);
	late final _StringsFilterEn filter = _StringsFilterEn._(_root);
	late final _StringsExpenseEn expense = _StringsExpenseEn._(_root);
	late final _StringsPaymentEn payment = _StringsPaymentEn._(_root);
	late final _StringsFinancialsEn financials = _StringsFinancialsEn._(_root);
	late final _StringsSeasonEn season = _StringsSeasonEn._(_root);
	late final _StringsTimeEn time = _StringsTimeEn._(_root);
	late final _StringsEnumsEn enums = _StringsEnumsEn._(_root);
}

// Path: errors
class _StringsErrorsEn {
	_StringsErrorsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get INVALID_EMAIL => 'Invalid email';
	String get EMAIL_EXISTS => 'Email exists';
	String get EMAIL_NOT_FOUND => 'Email not found';
	String get INVALID_PASSWORD => 'Invalid password';
	String get ENTER_PASSWORD => 'Enter password';
	String get ENTER_VALID_PASSWORD => 'Password has to contain one capital letter, one number and one special character.';
	String get passwordsNotMatching => 'Passwords are not matching.';
	String get ENTER_VALID_EMAIL => 'Enter valid email.';
	String get enterEmail => 'Ented email';
	String get NOT_ENOUGH_SYMBOLS => 'Not enough symbols';
	String get tryAgainLater => 'Error, try again later';
	String get MISSING_PARAMETERS => 'Missing field';
	String get tryAgain => 'Something went wrong, try again!';
	String get TEAM_NAME_MISSING => 'Missing team Name';
	String get UNAUTHORIZED => 'You have no permissions to access this page';
	String get USER_ALREADY_IN_TEAM => 'This user is already in the team you are trying to join';
	String get INVITATION_LINK_DOESNT_EXIST => 'Incorrect invitation link';
	String get USER_NOT_PART_OF_THE_TEAM => 'User is not part of the team';
	String get TOO_MANY_PARTICIPANTS => 'Maximum signed up participants';
	String get USER_ALREADY_SIGNED_UP => 'You have already signed up for this event!';
	String get CANT_DIVIDE_THIS_PAYMENT => 'You can\'t divide this payment';
	String get REGISTRATION_ALREADY_CLOSED => 'Registration is already closed';
	String get REGISTRATION_ALREADY_OPENED => 'Registration is already open';
	String get REGISTRATION_CLOSED => 'Registration closed';
	String get USER_NO_PRIVILEGES => 'This user does not have privileges to do this';
	String get NOTENOUGHMONEYINWALLET => 'Not enough money in wallet';
	String get UNAVAILABLE => 'Unavailable';
	String get INVALID_PHONE_NUMBER => 'Invalid phone number';
}

// Path: intro
class _StringsIntroEn {
	_StringsIntroEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get helloTitle => 'Hello!';
	String get hello => 'Nice to see you. \nLets get you set up with permissions, \nthese are needed for Olisport to function properly.';
	String get letsDoThat => 'Lets do that!';
	String get noThankYou => 'No thank you!';
}

// Path: authentication
class _StringsAuthenticationEn {
	_StringsAuthenticationEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get password => 'Password';
	String get login => 'Login';
	String get logOut => 'Log out';
	String get createTeam => 'Create Team';
	String get joinTeam => 'Join Team';
	String get forgotPassword => 'Forgot password?';
	String get invitationString => 'Invitation code';
	String get signUp => 'Sign up';
	String get ask => 'Ask your team manager for a code.';
}

// Path: signUp
class _StringsSignUpEn {
	_StringsSignUpEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get hey => 'Hey';
	String get signUpNow => 'Sign up now';
	String get ifHaveAccount => 'If you have an account';
	String get loginHere => 'login here';
	String get iAgreeToThe => 'I agree to the ';
	String get termsAndConditions => 'terms & conditions';
	String get privacyPolicies => 'Privacy policies';
	String get tellUsAboutTeam => 'Tell us about your team';
	String get soWeCanCustomizeExperience => 'so we can customize your experience better';
	String get seemsForgotPswrd => 'Seems like you forgot your password';
	String get enterEmailBelow => 'enter your email below';
}

// Path: user
class _StringsUserEn {
	_StringsUserEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get name => 'Name';
	String get lastName => 'Last name';
	String get birthday => 'Birthday';
	String get phoneNumber => 'Phone number';
	String get email => 'Email';
	String get profile => 'Profile';
	String get payments => 'Payments';
	String get myPayments => 'My payments';
	String get player => 'Player';
	String get addPlayer => 'Add team member';
	String get addPlayers => 'Add team members';
	String get accountSettings => 'Account settings';
	String get localizationSettings => 'Localization settings';
	String get language => 'Language settings';
	String get timeZone => 'Time zone settings';
	String get userUpdatedSuccessfully => 'User updated';
}

// Path: misc
class _StringsMiscEn {
	_StringsMiscEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get details => 'Details';
	String get created => 'Created';
	String get error => 'Error';
	String get success => 'Success';
	String get cont => 'Continue';
	String get home => 'Home';
	String get dataNotFound => 'Data not found!';
	String get reason => 'Reason';
	String get notes => 'Notes';
	String get startTime => 'Start time';
	String get endTime => 'End time';
	String get notAvaiable => 'Not avaiable';
	String get cancel => 'Cancel';
	String get add => 'Add';
	String get search => 'Search';
	String get map => 'Map';
	String get remove => 'Remove';
	String get yes => 'Yes';
	String get no => 'No';
	String get save => 'Save';
	String get subtract => 'Subtract';
	String get localeChangedSuccessfully => 'Locale changed';
	String get create => 'Create';
	String get timeZone => 'Time zone';
	String get selectAll => 'Select all';
	String get edit => 'Edit';
	String get all => 'All';
	String get back => 'Back';
	String get and => 'and';
}

// Path: team
class _StringsTeamEn {
	_StringsTeamEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get teamName => 'Team name';
	String get season => 'Season';
	String get practicePrice => 'Practice price';
	String get gamePrice => 'GamePrice';
	String get joinTeam => 'Join team';
	String get copyInviteCode => 'Copy invite code';
	String get copyTeamInviteCode => 'Copy team invite code';
	String get invitationCodeMessage => 'You have been invited to join your team in Olisport, use this invitaion code to register';
	String get inviteCodeCopied => 'Invite code copied.';
	String get practiceParticipationStats => 'Practice participation statistics';
	String get gameParticipationStats => 'Game participation statistics';
	String get teamMembers => 'Team members';
	String get teamMember => 'Team member';
	String get teamSettings => 'Team settings';
	String get team => 'Team';
	String get teams => 'Teams';
}

// Path: teamMember
class _StringsTeamMemberEn {
	_StringsTeamMemberEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get nameNotAvailable => 'Name not available';
	String get lastNameNotAvailable => 'Last name not available';
	String get phoneNumberNotAvailable => 'Phone number not available';
	String get takeModeratorAway => 'Take moderator away';
	String get giveModerator => 'Give moderator';
}

// Path: paymentStatus
class _StringsPaymentStatusEn {
	_StringsPaymentStatusEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get paymentStatus => 'Payment statuss';
	String get SETTLED => 'Settled';
	String get UNDERPAID => 'Underpaid';
	String get OVERPAID => 'Overpaid';
	String get UNKNOWN => 'Unknown';
	String get ALL => 'All';
}

// Path: transactionType
class _StringsTransactionTypeEn {
	_StringsTransactionTypeEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get transactionType => 'Transaction type';
	String get PAYMENT => 'Payment';
	String get EXPENSE => 'Expense';
	String get ALL => 'All';
}

// Path: phrases
class _StringsPhrasesEn {
	_StringsPhrasesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get registrationSuccessful => 'Congratulations, account created !';
	String get successfulPasswordReset => 'password reseted, check your email.';
	String get joinedTeamSuccessfully => 'Congratulations, you have joined team!';
	String get eventCreatedSuccessfully => 'Event created!';
	String get eventEditedSuccessfully => 'Event changes saved!';
}

// Path: events
class _StringsEventsEn {
	_StringsEventsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get eventInfo => 'Event info';
	String get eventName => 'Name of the event';
	String get eventPrice => 'Event price';
	String get eventType => 'Event type';
	String get eventStartTime => 'Event date and time';
	String get eventDate => 'Event date';
	String get eventTime => 'Time of the event';
	String get createEvent => 'Create event';
	String get eventLocationName => 'Location';
	String get joinEvent => 'Join event';
	String get resignFromEvent => 'Resign from event';
	String get joinedSuccessfully => '';
	String get resignedSuccessfully => '';
	String get cancelledSuccessfully => 'Event cancelled';
	String get maximumParticipantsExceeded => 'Maximum participants exceeded';
	String get registrationClosedSuccessfully => 'Registration closed';
	String get registrationOpenedSuccessfully => 'Registration opened';
	String get event => 'Event';
	String get maxParticipants => 'Maximum participants';
	String get signedUp => 'Signed up';
	String get eventCancelled => 'Event cancelled';
	String get endEvent => 'End event';
	String get eventEnded => 'Event ended';
	String get playersSignedUp => 'Players signed up';
	String get divide => 'If this box is checked, event price will be divided across all participants';
	String get edit => 'Edit event';
	String get cancelEditing => 'Cancel changes';
	String get cancel => 'Cancel event';
	String get managePaymentsQuestion => 'Would you like to manage payments?';
	String get choseNavigation => 'Chose your navigation application';
	String get alreadySignedUp => 'You have already signed up, if you signed up wrong person or wish to change the status of your participation, change your participation status in application or contact one of your team managers.';
}

// Path: participants
class _StringsParticipantsEn {
	_StringsParticipantsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get maxParticipants => 'Maximum participants';
}

// Path: filter
class _StringsFilterEn {
	_StringsFilterEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get byDate => 'Filter by date';
	String get filter => 'Filter';
}

// Path: expense
class _StringsExpenseEn {
	_StringsExpenseEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get create => 'Create expense';
	String get amount => 'Expense amount';
	String get created => 'Expense created';
	String get expenses => 'Expenses';
	String get expense => 'Expense';
	String get expenseDescription => 'An expense is an outgoing payment for goods or services used to operate or maintain teams functionallity.';
}

// Path: payment
class _StringsPaymentEn {
	_StringsPaymentEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get manage => 'Manage payments';
	String get amountToPay => 'Amount to pay';
	String get create => 'Create payment';
	String get created => 'Payment created';
	String get playerPayments => 'Player payments';
	String get payments => 'Payments';
	String get payment => 'Payment';
	String get noAssignedPayments => 'No assigned payments';
	String get payInFull => 'Pay in full';
	String get payFromWallet => 'Pay from wallet';
	String get pay => 'Pay';
	String get yourRecentPayments => 'Your recent payments';
	String get addToWallet => 'Add funds';
	String get subtractFromWallet => 'Subtract funds';
	String get paymentsDescription => 'Use "payments" to cover shared expenses or invest in common goals within the team\'s budget.';
}

// Path: financials
class _StringsFinancialsEn {
	_StringsFinancialsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get teamFinances => 'Team financials';
	String get playersPaid => 'Total paid by players';
	String get playersDebt => 'Total debt by players';
	String get paid => 'Paid';
	String get amount => 'Amount';
	String get finances => 'Team finances';
	String get walletBalanceAfterChanges => 'Wallet balance after changes.';
	String get wallet => 'Wallet';
	String get walletBalance => 'Wallet balance';
	String get teamWallet => 'Team wallet balance';
	String get transactions => 'Transactions';
	String get changesMadeSuccessfully => 'Wallet balance changed';
}

// Path: season
class _StringsSeasonEn {
	_StringsSeasonEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get newSeason => 'Create new season';
	String get archive => 'Current season will be archived permanently';
	String get seasonName => 'Season name';
	String get season => 'Season';
	String get seasonCreatedSuccessfully => 'Season created';
}

// Path: time
class _StringsTimeEn {
	_StringsTimeEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get time => 'Time';
	String get date => 'Date';
	late final _StringsTimeDaysEn days = _StringsTimeDaysEn._(_root);
	late final _StringsTimeMonthsEn months = _StringsTimeMonthsEn._(_root);
}

// Path: enums
class _StringsEnumsEn {
	_StringsEnumsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsEnumsEventTypesEn EventTypes = _StringsEnumsEventTypesEn._(_root);
	late final _StringsEnumsSportsEn Sports = _StringsEnumsSportsEn._(_root);
}

// Path: time.days
class _StringsTimeDaysEn {
	_StringsTimeDaysEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsTimeDaysShortEn short = _StringsTimeDaysShortEn._(_root);
	late final _StringsTimeDaysLongEn long = _StringsTimeDaysLongEn._(_root);
}

// Path: time.months
class _StringsTimeMonthsEn {
	_StringsTimeMonthsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	List<String> get long => [
		'January',
		'February',
		'March',
		'April',
		'May',
		'June',
		'July',
		'August',
		'September',
		'October',
		'November',
		'December',
	];
	List<String> get short => [
		'Jan.',
		'Feb.',
		'Mar.',
		'Apr.',
		'May.',
		'Jun.',
		'Jul.',
		'Aug.',
		'Sep.',
		'Oct.',
		'Nov.',
		'Dec.',
	];
}

// Path: enums.EventTypes
class _StringsEnumsEventTypesEn {
	_StringsEnumsEventTypesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get PRACTICE => 'Practice';
	String get GAME => 'Game';
	String get Other => 'Other';
}

// Path: enums.Sports
class _StringsEnumsSportsEn {
	_StringsEnumsSportsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get sport => 'Sports';
	String get ICEHOCKEY => 'Hockey';
	String get FOOTBALL => 'Football';
	String get FLOORBALL => 'Floorball';
	String get BASKETBALL => 'Basketball';
	String get HANDBALL => 'Handball';
	String get TENNIS => 'Tennis';
	String get VOLLEYBALL => 'Volleyball';
	String get RUGBY => 'Rugby';
	String get OTHER => 'Other';
}

// Path: time.days.short
class _StringsTimeDaysShortEn {
	_StringsTimeDaysShortEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get monday => 'Mon.';
	String get tuesday => 'Tue.';
	String get wednesday => 'Wed.';
	String get thursday => 'Thu.';
	String get friday => 'Fri.';
	String get saturday => 'Sat.';
	String get sunday => 'Sun.';
}

// Path: time.days.long
class _StringsTimeDaysLongEn {
	_StringsTimeDaysLongEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get monday => 'Monday';
	String get tuesday => 'Tuesday';
	String get wednesday => 'Wednesday';
	String get thursday => 'Thursday';
	String get friday => 'Friday';
	String get saturday => 'Saturday';
	String get sunday => 'Sunday';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'errors.INVALID_EMAIL': 'Invalid email',
			'errors.EMAIL_EXISTS': 'Email exists',
			'errors.EMAIL_NOT_FOUND': 'Email not found',
			'errors.INVALID_PASSWORD': 'Invalid password',
			'errors.ENTER_PASSWORD': 'Enter password',
			'errors.ENTER_VALID_PASSWORD': 'Password has to contain one capital letter, one number and one special character.',
			'errors.passwordsNotMatching': 'Passwords are not matching.',
			'errors.ENTER_VALID_EMAIL': 'Enter valid email.',
			'errors.enterEmail': 'Ented email',
			'errors.NOT_ENOUGH_SYMBOLS': 'Not enough symbols',
			'errors.tryAgainLater': 'Error, try again later',
			'errors.MISSING_PARAMETERS': 'Missing field',
			'errors.tryAgain': 'Something went wrong, try again!',
			'errors.TEAM_NAME_MISSING': 'Missing team Name',
			'errors.UNAUTHORIZED': 'You have no permissions to access this page',
			'errors.USER_ALREADY_IN_TEAM': 'This user is already in the team you are trying to join',
			'errors.INVITATION_LINK_DOESNT_EXIST': 'Incorrect invitation link',
			'errors.USER_NOT_PART_OF_THE_TEAM': 'User is not part of the team',
			'errors.TOO_MANY_PARTICIPANTS': 'Maximum signed up participants',
			'errors.USER_ALREADY_SIGNED_UP': 'You have already signed up for this event!',
			'errors.CANT_DIVIDE_THIS_PAYMENT': 'You can\'t divide this payment',
			'errors.REGISTRATION_ALREADY_CLOSED': 'Registration is already closed',
			'errors.REGISTRATION_ALREADY_OPENED': 'Registration is already open',
			'errors.REGISTRATION_CLOSED': 'Registration closed',
			'errors.USER_NO_PRIVILEGES': 'This user does not have privileges to do this',
			'errors.NOTENOUGHMONEYINWALLET': 'Not enough money in wallet',
			'errors.UNAVAILABLE': 'Unavailable',
			'errors.INVALID_PHONE_NUMBER': 'Invalid phone number',
			'intro.helloTitle': 'Hello!',
			'intro.hello': 'Nice to see you. \nLets get you set up with permissions, \nthese are needed for Olisport to function properly.',
			'intro.letsDoThat': 'Lets do that!',
			'intro.noThankYou': 'No thank you!',
			'authentication.password': 'Password',
			'authentication.login': 'Login',
			'authentication.logOut': 'Log out',
			'authentication.createTeam': 'Create Team',
			'authentication.joinTeam': 'Join Team',
			'authentication.forgotPassword': 'Forgot password?',
			'authentication.invitationString': 'Invitation code',
			'authentication.signUp': 'Sign up',
			'authentication.ask': 'Ask your team manager for a code.',
			'signUp.hey': 'Hey',
			'signUp.signUpNow': 'Sign up now',
			'signUp.ifHaveAccount': 'If you have an account',
			'signUp.loginHere': 'login here',
			'signUp.iAgreeToThe': 'I agree to the ',
			'signUp.termsAndConditions': 'terms & conditions',
			'signUp.privacyPolicies': 'Privacy policies',
			'signUp.tellUsAboutTeam': 'Tell us about your team',
			'signUp.soWeCanCustomizeExperience': 'so we can customize your experience better',
			'signUp.seemsForgotPswrd': 'Seems like you forgot your password',
			'signUp.enterEmailBelow': 'enter your email below',
			'user.name': 'Name',
			'user.lastName': 'Last name',
			'user.birthday': 'Birthday',
			'user.phoneNumber': 'Phone number',
			'user.email': 'Email',
			'user.profile': 'Profile',
			'user.payments': 'Payments',
			'user.myPayments': 'My payments',
			'user.player': 'Player',
			'user.addPlayer': 'Add team member',
			'user.addPlayers': 'Add team members',
			'user.accountSettings': 'Account settings',
			'user.localizationSettings': 'Localization settings',
			'user.language': 'Language settings',
			'user.timeZone': 'Time zone settings',
			'user.userUpdatedSuccessfully': 'User updated',
			'misc.details': 'Details',
			'misc.created': 'Created',
			'misc.error': 'Error',
			'misc.success': 'Success',
			'misc.cont': 'Continue',
			'misc.home': 'Home',
			'misc.dataNotFound': 'Data not found!',
			'misc.reason': 'Reason',
			'misc.notes': 'Notes',
			'misc.startTime': 'Start time',
			'misc.endTime': 'End time',
			'misc.notAvaiable': 'Not avaiable',
			'misc.cancel': 'Cancel',
			'misc.add': 'Add',
			'misc.search': 'Search',
			'misc.map': 'Map',
			'misc.remove': 'Remove',
			'misc.yes': 'Yes',
			'misc.no': 'No',
			'misc.save': 'Save',
			'misc.subtract': 'Subtract',
			'misc.localeChangedSuccessfully': 'Locale changed',
			'misc.create': 'Create',
			'misc.timeZone': 'Time zone',
			'misc.selectAll': 'Select all',
			'misc.edit': 'Edit',
			'misc.all': 'All',
			'misc.back': 'Back',
			'misc.and': 'and',
			'team.teamName': 'Team name',
			'team.season': 'Season',
			'team.practicePrice': 'Practice price',
			'team.gamePrice': 'GamePrice',
			'team.joinTeam': 'Join team',
			'team.copyInviteCode': 'Copy invite code',
			'team.copyTeamInviteCode': 'Copy team invite code',
			'team.invitationCodeMessage': 'You have been invited to join your team in Olisport, use this invitaion code to register',
			'team.inviteCodeCopied': 'Invite code copied.',
			'team.practiceParticipationStats': 'Practice participation statistics',
			'team.gameParticipationStats': 'Game participation statistics',
			'team.teamMembers': 'Team members',
			'team.teamMember': 'Team member',
			'team.teamSettings': 'Team settings',
			'team.team': 'Team',
			'team.teams': 'Teams',
			'teamMember.nameNotAvailable': 'Name not available',
			'teamMember.lastNameNotAvailable': 'Last name not available',
			'teamMember.phoneNumberNotAvailable': 'Phone number not available',
			'teamMember.takeModeratorAway': 'Take moderator away',
			'teamMember.giveModerator': 'Give moderator',
			'paymentStatus.paymentStatus': 'Payment statuss',
			'paymentStatus.SETTLED': 'Settled',
			'paymentStatus.UNDERPAID': 'Underpaid',
			'paymentStatus.OVERPAID': 'Overpaid',
			'paymentStatus.UNKNOWN': 'Unknown',
			'paymentStatus.ALL': 'All',
			'transactionType.transactionType': 'Transaction type',
			'transactionType.PAYMENT': 'Payment',
			'transactionType.EXPENSE': 'Expense',
			'transactionType.ALL': 'All',
			'phrases.registrationSuccessful': 'Congratulations, account created !',
			'phrases.successfulPasswordReset': 'password reseted, check your email.',
			'phrases.joinedTeamSuccessfully': 'Congratulations, you have joined team!',
			'phrases.eventCreatedSuccessfully': 'Event created!',
			'phrases.eventEditedSuccessfully': 'Event changes saved!',
			'events.eventInfo': 'Event info',
			'events.eventName': 'Name of the event',
			'events.eventPrice': 'Event price',
			'events.eventType': 'Event type',
			'events.eventStartTime': 'Event date and time',
			'events.eventDate': 'Event date',
			'events.eventTime': 'Time of the event',
			'events.createEvent': 'Create event',
			'events.eventLocationName': 'Location',
			'events.joinEvent': 'Join event',
			'events.resignFromEvent': 'Resign from event',
			'events.joinedSuccessfully': '',
			'events.resignedSuccessfully': '',
			'events.cancelledSuccessfully': 'Event cancelled',
			'events.maximumParticipantsExceeded': 'Maximum participants exceeded',
			'events.registrationClosedSuccessfully': 'Registration closed',
			'events.registrationOpenedSuccessfully': 'Registration opened',
			'events.event': 'Event',
			'events.maxParticipants': 'Maximum participants',
			'events.signedUp': 'Signed up',
			'events.eventCancelled': 'Event cancelled',
			'events.endEvent': 'End event',
			'events.eventEnded': 'Event ended',
			'events.playersSignedUp': 'Players signed up',
			'events.divide': 'If this box is checked, event price will be divided across all participants',
			'events.edit': 'Edit event',
			'events.cancelEditing': 'Cancel changes',
			'events.cancel': 'Cancel event',
			'events.managePaymentsQuestion': 'Would you like to manage payments?',
			'events.choseNavigation': 'Chose your navigation application',
			'events.alreadySignedUp': 'You have already signed up, if you signed up wrong person or wish to change the status of your participation, change your participation status in application or contact one of your team managers.',
			'participants.maxParticipants': 'Maximum participants',
			'filter.byDate': 'Filter by date',
			'filter.filter': 'Filter',
			'expense.create': 'Create expense',
			'expense.amount': 'Expense amount',
			'expense.created': 'Expense created',
			'expense.expenses': 'Expenses',
			'expense.expense': 'Expense',
			'expense.expenseDescription': 'An expense is an outgoing payment for goods or services used to operate or maintain teams functionallity.',
			'payment.manage': 'Manage payments',
			'payment.amountToPay': 'Amount to pay',
			'payment.create': 'Create payment',
			'payment.created': 'Payment created',
			'payment.playerPayments': 'Player payments',
			'payment.payments': 'Payments',
			'payment.payment': 'Payment',
			'payment.noAssignedPayments': 'No assigned payments',
			'payment.payInFull': 'Pay in full',
			'payment.payFromWallet': 'Pay from wallet',
			'payment.pay': 'Pay',
			'payment.yourRecentPayments': 'Your recent payments',
			'payment.addToWallet': 'Add funds',
			'payment.subtractFromWallet': 'Subtract funds',
			'payment.paymentsDescription': 'Use "payments" to cover shared expenses or invest in common goals within the team\'s budget.',
			'financials.teamFinances': 'Team financials',
			'financials.playersPaid': 'Total paid by players',
			'financials.playersDebt': 'Total debt by players',
			'financials.paid': 'Paid',
			'financials.amount': 'Amount',
			'financials.finances': 'Team finances',
			'financials.walletBalanceAfterChanges': 'Wallet balance after changes.',
			'financials.wallet': 'Wallet',
			'financials.walletBalance': 'Wallet balance',
			'financials.teamWallet': 'Team wallet balance',
			'financials.transactions': 'Transactions',
			'financials.changesMadeSuccessfully': 'Wallet balance changed',
			'season.newSeason': 'Create new season',
			'season.archive': 'Current season will be archived permanently',
			'season.seasonName': 'Season name',
			'season.season': 'Season',
			'season.seasonCreatedSuccessfully': 'Season created',
			'time.time': 'Time',
			'time.date': 'Date',
			'time.days.short.monday': 'Mon.',
			'time.days.short.tuesday': 'Tue.',
			'time.days.short.wednesday': 'Wed.',
			'time.days.short.thursday': 'Thu.',
			'time.days.short.friday': 'Fri.',
			'time.days.short.saturday': 'Sat.',
			'time.days.short.sunday': 'Sun.',
			'time.days.long.monday': 'Monday',
			'time.days.long.tuesday': 'Tuesday',
			'time.days.long.wednesday': 'Wednesday',
			'time.days.long.thursday': 'Thursday',
			'time.days.long.friday': 'Friday',
			'time.days.long.saturday': 'Saturday',
			'time.days.long.sunday': 'Sunday',
			'time.months.long.0': 'January',
			'time.months.long.1': 'February',
			'time.months.long.2': 'March',
			'time.months.long.3': 'April',
			'time.months.long.4': 'May',
			'time.months.long.5': 'June',
			'time.months.long.6': 'July',
			'time.months.long.7': 'August',
			'time.months.long.8': 'September',
			'time.months.long.9': 'October',
			'time.months.long.10': 'November',
			'time.months.long.11': 'December',
			'time.months.short.0': 'Jan.',
			'time.months.short.1': 'Feb.',
			'time.months.short.2': 'Mar.',
			'time.months.short.3': 'Apr.',
			'time.months.short.4': 'May.',
			'time.months.short.5': 'Jun.',
			'time.months.short.6': 'Jul.',
			'time.months.short.7': 'Aug.',
			'time.months.short.8': 'Sep.',
			'time.months.short.9': 'Oct.',
			'time.months.short.10': 'Nov.',
			'time.months.short.11': 'Dec.',
			'enums.EventTypes.PRACTICE': 'Practice',
			'enums.EventTypes.GAME': 'Game',
			'enums.EventTypes.Other': 'Other',
			'enums.Sports.sport': 'Sports',
			'enums.Sports.ICEHOCKEY': 'Hockey',
			'enums.Sports.FOOTBALL': 'Football',
			'enums.Sports.FLOORBALL': 'Floorball',
			'enums.Sports.BASKETBALL': 'Basketball',
			'enums.Sports.HANDBALL': 'Handball',
			'enums.Sports.TENNIS': 'Tennis',
			'enums.Sports.VOLLEYBALL': 'Volleyball',
			'enums.Sports.RUGBY': 'Rugby',
			'enums.Sports.OTHER': 'Other',
		};
	}
}
