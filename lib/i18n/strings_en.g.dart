///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	String get welcome => 'Welcome';
	String get welcomeBody => 'Tempus varius a vitae interdum id\ntortor elementum tristique eleifend at.';
	String get email => 'E Mail';
	String get password => 'Password';
	String get passwordRepeat => 'Password again';
	String get forgotPassword => 'Forgot password';
	String get signIn => 'Sign in';
	String get noAccount => 'You don\'t have an account?';
	String get register => 'Register';
	String get greetings => 'Hello';
	String get nameSurname => 'Name Surname';
	TextSpan alreadyHaveAnAccount({required InlineSpan value}) => TextSpan(children: [
		const TextSpan(text: 'Already have an account? '),
		value,
	]);
	TextSpan readAndAcceptTerms({required InlineSpan read, required InlineSpan acceptTerms, required InlineSpan userTerms}) => TextSpan(children: [
		const TextSpan(text: 'I did '),
		read,
		const TextSpan(text: ' and '),
		acceptTerms,
		const TextSpan(text: ' '),
		userTerms,
	]);
	String get read => 'read';
	String get accept => 'accept';
	String get userTerms => 'user terms';
	String get showMore => 'Show more';
	String get home => 'Home';
	String get profile => 'Profile';
	String get addPhoto => 'Add Photo';
	String get favoriteMovies => 'Favorite Movies';
	String get loadPhotos => 'Load photos';
	String get loadPhotosDescription => 'Resources out incentivize relaxation floor loss cc.';
	String get limitedOffer => 'Limited Offer';
	String get limitedOfferDescription => 'Jeton paketin’ni seçerek bonus kazanın ve yeni bölümlerin kilidini açın!';
	String get limitedOfferBonus => 'Bonuses you will get';
	String get kContinue => 'Continue';
	String get premiumAccount => 'Premium Account';
	String get moreMatch => 'More Match';
	String get morePromotions => 'More Promotions';
	String get moreLikes => 'More Likes';
	String get pickPackageToUnlock => 'Pick a package to unlock';
	String get seeAllTokens => 'See all tokens';
	late final TranslationsErrorsEn errors = TranslationsErrorsEn._(_root);
	late final TranslationsValidatorsEn validators = TranslationsValidatorsEn._(_root);
}

// Path: errors
class TranslationsErrorsEn {
	TranslationsErrorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get unknown => 'Unknown error';
	String get invalidCredentials => 'Invalid credentials';
	String get userExists => 'User exists';
	String get imageCouldntload => 'Image couldn\'t loaded';
	String get entityTooLarge => 'File size is too large';
}

// Path: validators
class TranslationsValidatorsEn {
	TranslationsValidatorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsValidatorsEmailEn email = TranslationsValidatorsEmailEn._(_root);
	late final TranslationsValidatorsPasswordEn password = TranslationsValidatorsPasswordEn._(_root);
	late final TranslationsValidatorsNameSurnameEn nameSurname = TranslationsValidatorsNameSurnameEn._(_root);
}

// Path: validators.email
class TranslationsValidatorsEmailEn {
	TranslationsValidatorsEmailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get empty => 'Please enter your email';
	String get notValid => 'Please enter a valid email address';
}

// Path: validators.password
class TranslationsValidatorsPasswordEn {
	TranslationsValidatorsPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get empty => 'Please enter your password';
	String get length => 'Password must be at least 8 characters long';
	String get reEnterPassword => 'Please re-enter your password';
	String get passwordDontMatch => 'Passwords do not match';
}

// Path: validators.nameSurname
class TranslationsValidatorsNameSurnameEn {
	TranslationsValidatorsNameSurnameEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get empty => 'Please enter your name and surname';
	String get nameAndSurname => 'Please enter both name and surname';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'welcome': return 'Welcome';
			case 'welcomeBody': return 'Tempus varius a vitae interdum id\ntortor elementum tristique eleifend at.';
			case 'email': return 'E Mail';
			case 'password': return 'Password';
			case 'passwordRepeat': return 'Password again';
			case 'forgotPassword': return 'Forgot password';
			case 'signIn': return 'Sign in';
			case 'noAccount': return 'You don\'t have an account?';
			case 'register': return 'Register';
			case 'greetings': return 'Hello';
			case 'nameSurname': return 'Name Surname';
			case 'alreadyHaveAnAccount': return ({required InlineSpan value}) => TextSpan(children: [
				const TextSpan(text: 'Already have an account? '),
				value,
			]);
			case 'readAndAcceptTerms': return ({required InlineSpan read, required InlineSpan acceptTerms, required InlineSpan userTerms}) => TextSpan(children: [
				const TextSpan(text: 'I did '),
				read,
				const TextSpan(text: ' and '),
				acceptTerms,
				const TextSpan(text: ' '),
				userTerms,
			]);
			case 'read': return 'read';
			case 'accept': return 'accept';
			case 'userTerms': return 'user terms';
			case 'showMore': return 'Show more';
			case 'home': return 'Home';
			case 'profile': return 'Profile';
			case 'addPhoto': return 'Add Photo';
			case 'favoriteMovies': return 'Favorite Movies';
			case 'loadPhotos': return 'Load photos';
			case 'loadPhotosDescription': return 'Resources out incentivize relaxation floor loss cc.';
			case 'limitedOffer': return 'Limited Offer';
			case 'limitedOfferDescription': return 'Jeton paketin’ni seçerek bonus kazanın ve yeni bölümlerin kilidini açın!';
			case 'limitedOfferBonus': return 'Bonuses you will get';
			case 'kContinue': return 'Continue';
			case 'premiumAccount': return 'Premium Account';
			case 'moreMatch': return 'More Match';
			case 'morePromotions': return 'More Promotions';
			case 'moreLikes': return 'More Likes';
			case 'pickPackageToUnlock': return 'Pick a package to unlock';
			case 'seeAllTokens': return 'See all tokens';
			case 'errors.unknown': return 'Unknown error';
			case 'errors.invalidCredentials': return 'Invalid credentials';
			case 'errors.userExists': return 'User exists';
			case 'errors.imageCouldntload': return 'Image couldn\'t loaded';
			case 'errors.entityTooLarge': return 'File size is too large';
			case 'validators.email.empty': return 'Please enter your email';
			case 'validators.email.notValid': return 'Please enter a valid email address';
			case 'validators.password.empty': return 'Please enter your password';
			case 'validators.password.length': return 'Password must be at least 8 characters long';
			case 'validators.password.reEnterPassword': return 'Please re-enter your password';
			case 'validators.password.passwordDontMatch': return 'Passwords do not match';
			case 'validators.nameSurname.empty': return 'Please enter your name and surname';
			case 'validators.nameSurname.nameAndSurname': return 'Please enter both name and surname';
			default: return null;
		}
	}
}

