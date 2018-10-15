<template>
    <div class="nav flex flex-v-center">
        <span class="nav__logo">
        Logo
        </span>
        <div class="nav__item-container flex flex-h-end" :class="{ 'nav__pane': isBurgerNav, 'nav__pane--active': isNavPaneActive }">
            <button class="button button--plain nav__close icon-close" v-show="isBurgerNav" @click="closeNavPane"></button>
            <span class="nav__item" v-for="option in navOptions" :key="option.id">
                <nav-bar-dropdown
                    v-if="option.children" 
                    v-on:navbar-dropdown-click="toggleDropdown(option.id)" 
                    v-on:navbar-dropdown-click-outside="handleClickOutside(option.id)" 
                    :item="option" 
                    :isActive="isActiveDropdown(option.id)">
                </nav-bar-dropdown>
                <nav-bar-link v-else :title="option.name" :item="option"></nav-bar-link>
            </span>
        </div>
        <button class="button button--plain nav__burger icon-burger" v-show="isBurgerNav" @click="openNavPane"></button>
    </div>
</template>

<script>
import NavBarDropdown from './NavBarDropdown';
import NavBarLink from './NavBarLink';
import { mixinResponsive } from '../mixins/mixin-responsive';

//TODO: move navOptions to props
export default {
    components: {
        NavBarDropdown,
        NavBarLink
    },

    mixins: [ mixinResponsive ],

    data: function () {
        return {
            navOptions: [
                {
                    id: 1,
                    name: 'About',
                    children: [
                        {
                            id: 1,
                            name: 'What is AERM?'
                        },
                        {
                            id: 2,
                            name: 'About NCFA'
                        }
                    ]
                },
                {
                    id: 2,
                    name: 'Explore',
                },
                {
                    id: 3,
                    name: 'Data & Methodology',
                    children: [
                        {
                            id: 1,
                            name: 'Methodology'
                        },
                        {
                            id:2,
                            name: 'Data'
                        },
                        {
                            id:3,
                            name: 'Rating'
                        },
                        {
                            id:4,
                            name: 'Services'
                        },
                        {
                            id:5,
                            name: 'Sectors'
                        },
                        {
                            id:6,
                            name: 'Drivers'
                        },
                        {
                            id:7,
                            name: 'Assests'
                        },
                    ]
                },
                {
                    id: 4,
                    name: 'Contact',
                }
            ],
            selectedDropdownId: null,
            isNavPaneActive: false
        };
    },

    computed: {
        isBurgerNav: function () {
            return this.isSmall();
        }
    },

    methods: {
        toggleDropdown (id) {
            this.selectedDropdownId = this.selectedDropdownId === id ? null : id;
        },
        closeDropdown () {
            this.selectedDropdownId = null;
        },
        handleClickOutside (id) {
            if(this.selectedDropdownId === id && !this.isBurgerNav) { this.closeDropdown() };
        },
        isActiveDropdown (id) {
            return id === this.selectedDropdownId;
        },
        openNavPane () {
            this.isNavPaneActive = true;
        },
        closeNavPane () {
            this.isNavPaneActive = false;
        }
    } 
}
</script>

