dataSource {
    pooled = true
    driverClassName = "org.hsqldb.jdbcDriver"
    username = "sa"
    password = ""
}
hibernate {
   cache.use_second_level_cache = false
   cache.use_query_cache = false
   cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            if(InetAddress.getLocalHost().getHostName()=="lmettini"){
                driverClassName = "org.postgresql.Driver" //the database driver class name
                username = "arofjsvuojifkr" //database name
                password = "root" //database password
                dbCreate = "update"
                url = "jdbc:postgresql://localhost:5433/dd2qd1r0jj283p"
            }else{
                dbCreate = "create-drop" // one of 'create', 'create-drop','update'
                url = "jdbc:hsqldb:mem:devDB"
            }
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:hsqldb:mem:testDb"
        }
    }
    production {
        dataSource {
            driverClassName = "org.postgresql.Driver" //the database driver class name
            username = "arofjsvuojifkr" //database name
            password = "T8Y2DTWX_Lp976a7UC1K2hoG1r" //database password
            dbCreate = "update"
            url = "jdbc:postgresql://ec2-23-21-209-58.compute-1.amazonaws.com:5432/dd2qd1r0jj283p"
            //url = "jdbc:hsqldb:file:prodDb;shutdown=true"
        }
    }


}
