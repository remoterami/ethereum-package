# TODO replace with official image when private key is passable for user accounts
MEV_FLOOD_IMAGE = "h4ck3rk3y/mev-flood"


def launch_mev_flood(plan, el_uri):
    plan.add_service(
        name = "mev-flood",
        config = ServiceConfig(
            image = MEV_FLOOD_IMAGE,
            entrypoint = ["tail", "-f", "/dev/null"]
        )
    )

    plan.exec(
        service_name = "mev-flood",
        recipe = ExecRecipe(
            command = ["/bin/sh", "-c", "./run init -r {0} -k 0xef5177cd0b6b21c87db5a0bf35d4084a8a57a9d6a064f86d51ac85f2b873a4e2 -s deployment.json".format(el_uri)]
        )
    )

    # plan.exec(
    #     service_name = "mev-flood",
    #     recipe = ExecRecipe(
    #         command = ["/bin/sh", "-c", "./run spam -r {0} -k 0xef5177cd0b6b21c87db5a0bf35d4084a8a57a9d6a064f86d51ac85f2b873a4e2 -l deployment.json".format(el_uri)]
    #     )
    # )


    # ./run spam -r http://172.16.1.4:8545 -k 0xef5177cd0b6b21c87db5a0bf35d4084a8a57a9d6a064f86d51ac85f2b873a4e2 -l deployment.json