<template>
    <router-link 
        :to="'/'+link" 
        class="button">{{title}}</router-link>
</template>

<script>
export default {
    props: {
        title: String,
        link: String
    }
}
</script>

<style scoped>
.button {
    border: 1px solid #000;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 395px;
    height: 59px;
    text-decoration: none;
    color: #000;
    margin: 10px 0;
    font-size: 16px;
    background: #fff;
}
</style>