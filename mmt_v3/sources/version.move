module mmt_v3::version {

    public struct Version has key, store {
        id: UID,
        major_version: u64,
        minor_version: u64
    }

    public struct VersionCap has key, store {
        id: UID
    }

    fun init(ctx: &mut TxContext) {
        abort 0
    }

    // ======= version control ==========
    
    public fun value_major(v: &Version): u64 { abort 0 }
    public fun value_minor(v: &Version): u64 { abort 0 }

    public fun upgrade_major(v: &mut Version, _: &VersionCap) {
        abort 0
    }

    public fun upgrade_minor(v: &mut Version, val: u64, _: &VersionCap) {
        abort 0
    }

    public fun set_version(v: &mut Version, _: &VersionCap, major: u64, minor: u64) {
        abort 0
    }

    public fun is_supported_major_version(v: &Version): bool {
        abort 0
    }

    public fun is_supported_minor_version(v: &Version): bool {
        abort 0
    }

    public fun assert_supported_version(v: &Version) {
        abort 0
    }

    #[test_only]
    public fun init_(ctx: &mut TxContext):Version {
        let version = Version {
            id: object::new(ctx),
            major_version: current_major_version(),
            minor_version: current_minor_version()
        };
        let cap = VersionCap {
            id: object::new(ctx),
        };
        // transfer::share_object(version);
        transfer::transfer(cap, tx_context::sender(ctx));

        version
    }
    
    #[allow(unused_variable)]
    #[test_only]
    public fun destroy_version_for_testing(version:Version) {
        let Version{id,minor_version,major_version} =  version;
        object::delete(id);
    }
}